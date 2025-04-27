#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_MSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < nframe * dim) { // Only compute if within bounds
        int k = index / dim;
        int i = index % dim;
        float *gradInput_k = gradInput + k * dim;
        float *input_k = input + k * dim;
        float *target_k = target + k * dim;
        gradInput_k[i] = norm * (input_k[i] - target_k[i]); // Compute gradInput
    }
}