#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _drop(int n, float *x, float *xmask, float dropout, float scale) {
    // Use a stride loop and avoid recalculating i
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for (; i < n; i += stride) {
        if (xmask[i] < dropout) {
            x[i] = 0;
        } else {
            x[i] *= scale;
        }
    }
}