#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _drop64(int n, double *x, double *xmask, double dropout, double scale) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < n; i += stride) {  // Use a loop with built-in stride calculation
        if (xmask[i] < dropout) {
            x[i] = 0;
        } else {
            x[i] *= scale;
        }
    }
}