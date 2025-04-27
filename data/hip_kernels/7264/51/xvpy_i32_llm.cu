#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void xvpy_i32 (int* x, int* v, int* y, int len) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use loop unrolling to optimize for memory access
    int stride = blockDim.x * gridDim.x;
    for (int i = idx; i < len; i += stride) {
        y[i] += x[i] * v[i];
    }
}