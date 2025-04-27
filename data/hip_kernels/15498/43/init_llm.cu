#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(int n, float *x, float *y) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (int i = index; i < n; i += stride) {
        x[i] = 1.0f; // Initialize x[i] with 1.0f
        y[i] = 2.0f; // Initialize y[i] with 2.0f
    }
}