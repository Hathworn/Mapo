#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_scalar_float(int n, int idx, float dx, float *dy, int incy, float *result) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride loop for efficient range handling
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = dy[i] + dx;
        }
    }
}