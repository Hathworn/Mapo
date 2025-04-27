#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bin_start(int *binStart, int *binEnd, int *partBin, int nparts)
{
    // This kernel function was adapted from NVIDIA CUDA 5.5 Examples
    // This software contains source code provided by NVIDIA Corporation

    extern __shared__ int sharedBin[];  // blockSize + 1
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (index < nparts) {
        int bin = partBin[index];
        sharedBin[threadIdx.x + 1] = bin;

        // Load the neighbor particle bin for the first thread in the block
        if (threadIdx.x == 0) {
            sharedBin[0] = (index > 0) ? partBin[index - 1] : -1; // Use -1 if index is 0
        }
    }
    __syncthreads();

    if (index < nparts) {
        int bin = partBin[index];
        
        // Handle first particle in a bin
        if (index == 0 || bin != sharedBin[threadIdx.x]) {
            binStart[bin] = index;
            if (index > 0) {
                binEnd[sharedBin[threadIdx.x]] = index;
            }
        }

        // Special case for the last particle
        if (index == nparts - 1) {
            binEnd[bin] = index + 1;
        }
    }
}