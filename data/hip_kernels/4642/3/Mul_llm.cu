#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Mul(float *A, float *B, float *C, int nx, int ny) {
    // Calculate flattened index once per thread
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = ix * ny + iy;

    // Use a conditional branch to avoid unnecessary calculations
    if (ix < nx && iy < ny) {
        C[idx] = A[idx] * B[idx];
    }
}