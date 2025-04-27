#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void chainFunction ( const int dim, const int nwl, const int nst, const int ipr, const float *smpls, float *chnFnctn ) {
    // Calculate the linear index for the current thread
    int t = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * nwl;
    
    // Ensure within bounds before accessing memory
    if (threadIdx.x + blockIdx.x * blockDim.x < nwl && threadIdx.y + blockIdx.y * blockDim.y < nst) {
        chnFnctn[t] = smpls[ipr + t * dim];
    }
}