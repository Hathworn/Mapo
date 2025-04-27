#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void constantArray(const int n, const float c, float *a) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    // Use loop unrolling to optimize memory operations
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        a[i] = c;
    }
}