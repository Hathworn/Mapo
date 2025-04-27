#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_OneVsAllNLLCriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, int nframe, int dim, int sizeaverage, float *positiveWeight)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= nframe * dim) return;  // Boundary check

    // Calculate frame index and dimension index
    int k = idx / dim;
    int i = idx % dim;

    float g = (sizeaverage ? 1. / ((float)nframe) : 1.);
    int target_k = ((int)target[k]) - 1;

    float *input_k = input + k * dim;
    float *gradInput_k = gradInput + k * dim;

    // Calculate gradient for current element
    float z = (i == target_k) ? -g * positiveWeight[i] / input_k[i] : g / (1 - input_k[i]);
    gradInput_k[i] = z;
}