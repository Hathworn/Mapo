#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void THCudaTensor_copyUpperSymmetric(float *input, int n, int len)
{
    // Improvement: Use grid-stride loop for better utilization of GPU
    for (int idx = threadIdx.x + blockIdx.x * blockDim.x; idx < len; idx += blockDim.x * gridDim.x) {
        const int r = idx % n; // Row index
        const int c = idx / n; // Column index
        if (r > c) {
            input[idx] = input[r*n + c]; // Copy upper symmetric matrix value
        }
    }
}