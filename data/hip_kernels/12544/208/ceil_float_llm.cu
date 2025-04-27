#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ceil_float(int n, int idx, float *dy, int incy, float *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index
    int stride = blockDim.x * gridDim.x; // Calculate the stride for grid-stride loop

    // Optimize with a grid-stride loop
    for (; i < n; i += stride) {
        if (i >= idx && i % incy == 0) {
            result[i] = ceil(dy[i]); // Apply ceil function
        }
    }
}