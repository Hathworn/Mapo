#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateWalkers (const int dim, const int nwl, const float *xx1, const float *q, const float *r, float *xx0) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Optimize boundary check and ensure valid memory access
    if (i < dim && j < nwl) {
        int t = i + j * dim; 
        // Use conditional operator to avoid redundant branches
        xx0[t] = (q[j] > r[j]) * xx1[t] + (q[j] <= r[j]) * xx0[t];
    }
}