#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatAdd(float *A, float *B, float *C, int nx, int ny) {
    // Calculate the linear index using blockIdx, blockDim, and threadIdx
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = ix * ny + iy;

    // Ensure thread index is within matrix bounds before performing addition
    if (ix < nx && iy < ny) {
        C[idx] = A[idx] + B[idx];
    }
}