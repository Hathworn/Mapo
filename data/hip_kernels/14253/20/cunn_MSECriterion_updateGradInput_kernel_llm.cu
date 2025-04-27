#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cunn_MSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    int k = blockIdx.x;
    float *gradInput_k = gradInput + k * dim;
    float *input_k = input + k * dim;
    float *target_k = target + k * dim;

    int i = threadIdx.x;

    // Use one thread per element if there are enough threads, avoiding unnecessary calculations
    if (i < dim) {
        gradInput_k[i] = norm * (input_k[i] - target_k[i]);
    }
}