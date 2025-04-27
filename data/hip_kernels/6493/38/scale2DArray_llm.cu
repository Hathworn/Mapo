#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale2DArray ( const int dim, const int nwl, const float *zr, const float *xx, float *xx1 ) {
    // Calculate flat 1D global index for the 2D grid
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = threadIdx.y + blockDim.y * blockIdx.y;

    // Ensure index is within bounds before accessing arrays
    if (i < dim && j < nwl) {
        int t = i + j * dim; // Compute index only if within bounds
        xx1[t] = zr[j] * xx[t]; // Perform scaling
    }
}