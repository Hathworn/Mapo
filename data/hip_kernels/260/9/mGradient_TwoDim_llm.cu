#include "hip/hip_runtime.h"
#include "includes.h"

__device__ bool checkBoundary(int blockIdx, int blockDim, int threadIdx) {
    int x = threadIdx;
    int y = blockIdx;
    return (x == 0 || x == (blockDim - 1) || y == 0 || y == 479);
}

__global__ void mGradient_TwoDim(float *u_dimX, float *u_dimY, float *scalar, float coeffX, float coeffY) {
    // Calculate the unique thread index
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;
    int Left, Right, Top, Bottom;

    // Quick return if on the boundary to avoid warp divergence
    if(checkBoundary(blockIdx.x, blockDim.x, threadIdx.x)) return;

    // Precompute indices for better memory access
    Left = Idx - 1;
    Right = Idx + 1;
    Top = Idx + blockDim.x;
    Bottom = Idx - blockDim.x;

    // Calculate the gradients using coeffs and neighboring values
    u_dimX[Idx] -= (scalar[Right] - scalar[Left]) * coeffX;
    u_dimY[Idx] -= (scalar[Top] - scalar[Bottom]) * coeffY;
}