#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rdiv_float(int n, float *a, float *b, float *sum)
{
    // Use grid stride loop for optimized parallel execution
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (int idx = i; idx < n; idx += stride) {
        sum[idx] = b[idx] / a[idx];
    }
}