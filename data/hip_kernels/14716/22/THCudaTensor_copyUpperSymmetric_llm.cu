#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_copyUpperSymmetric(float *input, int n, int len)
{
    // Calculate 1D index for optimization in accessing elements
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize stride loop by using grid stride loop
    for (int i = idx; i < len; i += gridDim.x * blockDim.x) {
        const int r = i % n;
        const int c = i / n;
        if (r > c) {
            input[i] = input[r * n + c];
        }
    }
}