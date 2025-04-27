#include "hip/hip_runtime.h"
#include "includes.h"

// Calculate d[n] = a[n]*b[n] + c[n]

__global__ void custom_kernel(float *a, float *b, float *c, float *d, int N) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Loop unrolling to improve performance
    int stride = blockDim.x * gridDim.x;
    for (int i = idx; i < N; i += stride) {
        d[i] = a[i] * b[i] + c[i];
    }
}