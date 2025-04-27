#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _emul64(int n, double *x, double *y) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Optimize by using stride-based loop
    for (; i < n; i += stride) {
        y[i] *= x[i]; // Perform in-place multiplication
    }
}