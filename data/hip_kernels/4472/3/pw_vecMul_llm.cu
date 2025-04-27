#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pw_vecMul(float *y, float *a, float *b, int n) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Use a stride loop to process more elements per thread, improving load balance
    for (int i = idx; i < n; i += stride) {
        y[i] = a[i] * b[i];
    }
}