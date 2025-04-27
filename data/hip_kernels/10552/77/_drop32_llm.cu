#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _drop32(int n, float *x, float *y, float *xmask, double dropout, double scale) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x; // Precompute stride for all threads
    while (i < n) {
        // Utilize ternary operator for conditional assignments
        y[i] = (xmask[i] < dropout) ? 0.0f : x[i] * scale;
        i += stride;
    }
}