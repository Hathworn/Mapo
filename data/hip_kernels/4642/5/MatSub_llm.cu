#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatSub(float *A, float *B, float *C, int nx, int ny) {
    // Calculate unique index for each element
    int idx = blockIdx.x * blockDim.x * ny + threadIdx.x * ny + blockIdx.y * blockDim.y + threadIdx.y;

    // Check boundary before subtraction
    if (idx < nx * ny) {
        C[idx] = A[idx] - B[idx];
    }
}