#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addWalkers ( const int dim, const int nwl, const float *xx0, const float *xxW, float *xx1 ) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Check boundaries before computation to avoid unnecessary work
    if (i < dim && j < nwl) {
        int t = i + j * dim; // Calculate once, use multiple times
        xx1[t] = __fmaf_rn(xx0[t], 1.0f, xxW[t]);  // Use fused multiply-add for better performance
    }
}