#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void arrayOf2DConditions(const int dim, const int nwl, const float *bn, const float *xx, float *cc) {
    // Calculate unique thread index
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = threadIdx.y + blockDim.y * blockIdx.y;

    // Avoid unnecessary memory access
    if (i < dim && j < nwl) {
        int t = i + j * dim; // Move index computation inside condition
        float x_val = xx[t];
        // Use temporary variables to reduce repetitive computation
        bool cond1 = bn[0 + i * 2] < x_val;
        bool cond2 = x_val < bn[1 + i * 2];
        cc[t] = cond1 * cond2;
    }
}