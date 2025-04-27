#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shiftWalkers(const int dim, const int nwl, const float *xx, const float *x, float *yy) {
    // Use a single thread index calculation instead of separate i and j calculations
    int index = blockIdx.x * blockDim.x + threadIdx.x + 
                (blockIdx.y * blockDim.y + threadIdx.y) * dim;
    
    // Check both conditions together to reduce branching
    if (threadIdx.x < dim && threadIdx.y < nwl) {
        yy[index] = xx[index] - x[threadIdx.x];
    }
}