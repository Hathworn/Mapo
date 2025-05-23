#include "hip/hip_runtime.h"
#include "includes.h"

__device__ bool checkBoundary(int blockIdx, int blockDim, int threadIdx) {
    int x = threadIdx;
    int y = blockIdx;
    return (x == 0 || x == (blockDim - 1) || y == 0 || y == 479);
}

__global__ void mJocobi_TwoDim(float *x_new, float *x_old, float* b, float alpha, float rBeta) {
    // Calculate global index once per thread
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Avoid branch divergence by computing within bounds
    if (!checkBoundary(blockIdx.x, blockDim.x, threadIdx.x)) {
        int Left   = Idx - 1;
        int Right  = Idx + 1;
        int Top    = Idx + blockDim.x;
        int Bottom = Idx - blockDim.x;

        // Perform computation inline
        x_new[Idx] = ((x_old[Left] + x_old[Right] + x_old[Top] + x_old[Bottom]) * alpha + b[Idx]) * rBeta;
    }
}