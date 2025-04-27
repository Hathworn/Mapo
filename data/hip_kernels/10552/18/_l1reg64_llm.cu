#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _l1reg64(int n, double l1, double *w, double *dw) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;  // Calculate stride outside the loop
    while (i < n) {
        double wi = w[i];  // Cache w[i] to reduce global memory access
        if (wi > 0) dw[i] += l1;
        else if (wi < 0) dw[i] -= l1;
        i += stride;
    }
}