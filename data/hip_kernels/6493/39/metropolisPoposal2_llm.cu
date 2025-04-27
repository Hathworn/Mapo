#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void metropolisPoposal2 (const int dim, const int nwl, const int isb, const float *xx, const float *rr, float *xx1) {
    // Use a 1D grid and calculate a 2D index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate flat index
    if (i < dim && j < nwl) {
        int t = i + j * dim;
        // Simplify conditional addition
        xx1[t] = xx[t] + (i == isb ? rr[j] : 0.0f);
    }
}