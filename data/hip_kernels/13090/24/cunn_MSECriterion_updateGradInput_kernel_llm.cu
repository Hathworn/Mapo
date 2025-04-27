#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_MSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    // Optimize using shared memory and unroll loop
    extern __shared__ float shared_input[];
    int k = blockIdx.x;
    float *gradInput_k = gradInput + k*dim;
    float *input_k = input + k*dim;
    float *target_k = target + k*dim;
    
    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    // Load inputs into shared memory
    for (int i=i_start; i<i_end; i+=i_step) {
        shared_input[threadIdx.x] = input_k[i];
        __syncthreads();
        
        // Perform computation using shared memory for better memory access pattern
        gradInput_k[i] = norm * (shared_input[threadIdx.x] - target_k[i]);
        __syncthreads();
    }
}