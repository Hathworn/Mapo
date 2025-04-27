#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_MSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    int k = blockIdx.x;
    float *gradInput_k = gradInput + k * dim;
    float *input_k = input + k * dim;
    float *target_k = target + k * dim;

    int idx = blockDim.x * blockIdx.x + threadIdx.x;  // Global thread index

    // Ensure we do not exceed array boundaries
    if (idx < nframe * dim) {
        int i = idx % dim;
        gradInput_k[i] = norm * (input_k[i] - target_k[i]);
    }
}