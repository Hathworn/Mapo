#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mInitVelocity(float *u_dimX, float *u_dimY) {
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Prevent out-of-bounds access
    if (Idx < gridDim.x * blockDim.x) {
        u_dimX[Idx] = 0.f;

        // Cache the reciprocal of (blockIdx.x + 1) to avoid redundant computation
        float reciprocal = 0.8f / (float)(blockIdx.x + 1);
        u_dimY[Idx] = reciprocal;
    }
}