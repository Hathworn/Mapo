#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void div(float *A, float *B, float *C, int nx, int ny) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;
    int idx = ix * ny + iy;

    // Ensure the thread is within the bounds
    if (ix < nx && iy < ny) {
        C[idx] = A[idx] / B[idx];
    }
}