#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel0(int n, float a, float *x, float *y) {
    // Using grid-stride loop for better resource utilization
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; i < n; i += stride) {
        y[i] = a * x[i] + y[i];
    }
}