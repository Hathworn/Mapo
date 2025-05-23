#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_copyUpperSymmetric(float *input, int n, int len)
{
    // Use grid-stride loop for better utilization of threads
    for (int idx = threadIdx.x + blockIdx.x * blockDim.x; idx < len; idx += gridDim.x * blockDim.x) {
        const int r = idx % n;
        const int c = idx / n;

        if (r > c) {
            input[idx] = input[r * n + c];
        }
    }
}