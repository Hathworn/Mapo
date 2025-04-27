#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _drop64(int n, double *x, double *y, double *xmask, double dropout, double scale) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (; i < n; i += stride) { // Unrolling loop and using stride for better performance
        double mask_val = xmask[i]; // Reduce global memory access
        y[i] = (mask_val < dropout) ? 0 : x[i] * scale; // Use ternary operator
    }
}