#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_copyUpperSymmetric(float *input, int n, int len)
{
    // Using grid-stride loop for improved access pattern and performance
    for (int idx = blockIdx.x * blockDim.x + threadIdx.x; idx < len; idx += blockDim.x * gridDim.x) {
        const int r = idx % n;
        const int c = idx / n;
        if (r > c) {
            input[idx] = input[r * n + c];
        }
    }
}