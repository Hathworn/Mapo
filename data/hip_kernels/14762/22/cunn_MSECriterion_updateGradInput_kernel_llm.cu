```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_MSECriterion_updateGradInput_kernel(float *gradInput, float *input, float *target, float norm, int nframe, int dim)
{
    int k = blockIdx.x;
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    // Calculate index for each thread in 1D
    if (i < nframe * dim) {
        gradInput[i] = norm * (input[i] - target[i]);
    }
}