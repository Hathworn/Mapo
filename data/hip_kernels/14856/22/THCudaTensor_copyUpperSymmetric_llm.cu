#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void THCudaTensor_copyUpperSymmetric(float *input, int n, int len)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling to improve performance
    for (int i = idx; i < len; i += gridDim.x * blockDim.x) {
        const int r = i % n;
        const int c = i / n;
        if (r > c) {
            input[i] = input[r * n + c];
        }
    }
}