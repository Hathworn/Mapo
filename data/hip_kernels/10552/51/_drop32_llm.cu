#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _drop32(int n, float *x, float *xmask, float dropout, float scale) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Loop unrolling for better performance
    for (; i < n; i += stride * 4) {
        if (i < n) {
            if (xmask[i] < dropout) x[i] = 0;
            else x[i] *= scale;
        }
        if (i + stride < n) {
            if (xmask[i + stride] < dropout) x[i + stride] = 0;
            else x[i + stride] *= scale;
        }
        if (i + 2 * stride < n) {
            if (xmask[i + 2 * stride] < dropout) x[i + 2 * stride] = 0;
            else x[i + 2 * stride] *= scale;
        }
        if (i + 3 * stride < n) {
            if (xmask[i + 3 * stride] < dropout) x[i + 3 * stride] = 0;
            else x[i + 3 * stride] *= scale;
        }
    }
}