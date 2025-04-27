```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ bool checkBoundary(int blockIdx, int blockDim, int threadIdx) {
    int x = threadIdx;
    int y = blockIdx;
    return (x == 0 || x == (blockDim-1) || y == 0 || y == 479);
}

__global__ void mDivergence_TwoDim(float *div, float *u_dimX, float *u_dimY, float r_sStep) {
    // Calculate the global thread id
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the current thread is at the boundary, and return early if true
    if (checkBoundary(blockIdx.x, blockDim.x, threadIdx.x)) return;
    
    // Calculate neighbors using precomputed Idx
    int Left   = Idx - 1;
    int Right  = Idx + 1;
    int Top    = Idx + blockDim.x;
    int Bottom = Idx - blockDim.x;
    
    // Calculate divergence and store in output
    div[Idx] = ((u_dimX[Right]-u_dimX[Left])+(u_dimY[Top]-u_dimY[Bottom]))*r_sStep;
}