#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void combineSourceAndBackground(const int nwl, const int n, const float scale, float *src, const float *bkg) {
    // Calculate 1D index using 2D grid and block dimensions for better memory coalescing
    int globalIdx = threadIdx.x + blockDim.x * blockIdx.x + (threadIdx.y + blockDim.y * blockIdx.y) * n;
    
    if (globalIdx < nwl * n) {
        // Optimize memory access pattern by using linear index
        src[globalIdx] = src[globalIdx] + scale * bkg[globalIdx];
    }
}