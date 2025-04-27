#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory for faster access
__global__ void cunn_MSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    extern __shared__ float shared_target[];
    
    int k = blockIdx.x;
    float *gradInput_k = gradInput + k * dim;
    float *input_k = input + k * dim;

    int i_start = threadIdx.x;
    int i_step = blockDim.x;

    // Load target data into shared memory
    for (int i = i_start; i < dim; i += i_step) {
        shared_target[i] = target[k * dim + i];
    }
    __syncthreads();

    // Compute gradInput using shared memory
    for (int i = i_start; i < dim; i += i_step) {
        gradInput_k[i] = norm * (input_k[i] - shared_target[i]);
    }
}