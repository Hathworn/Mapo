#include "hip/hip_runtime.h"
#include "includes.h"

// HIP kernel to initialize elements of two arrays with improved indexing
__global__ void init(int n, float *x, float *y) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce global memory access if necessary (omitted for simplicity)
    for (int i = index; i < n; i += stride) {
        x[i] = 1.0f;
        y[i] = 2.0f;
    }
}