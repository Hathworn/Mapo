#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatSub(float *A, float *B, float *C, int nx, int ny) {
    // Calculate the global thread ID
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = iy * nx + ix; // Optimize for coalesced memory access

    // Ensure indices are within bounds
    if (ix < nx && iy < ny) {
        C[idx] = A[idx] - B[idx];
    }
}