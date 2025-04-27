#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_MSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    int k = blockIdx.x;
    float *gradInput_k = gradInput + k * dim;
    float *input_k = input + k * dim;
    float *target_k = target + k * dim;

    int i = threadIdx.x;
    int totalThreads = blockDim.x * gridDim.x;
    // Unroll the loop to increase performance and ensure memory coalescing
    for (int idx = i; idx < dim; idx += totalThreads)
    {
        gradInput_k[idx] = norm * (input_k[idx] - target_k[idx]);
    }
}