#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void substractWalkers(const int dim, const int nwl, const float *xx0, const float *xxCP, float *xx1) {
    // Calculate 1D index for the grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (idx < dim * nwl) {
        xx1[idx] = xx0[idx] - xxCP[idx];
    }
}