#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void glcm_calculation_90(int *A, int *glcm, const int nx, const int ny, int max) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    // Check if within bounds
    if (ix >= nx || iy >= ny - 1) return;

    unsigned int idx = iy * nx + ix;
    int k = max * A[idx + nx] + A[idx];
    // Use atomic add for parallel updates
    atomicAdd(&glcm[k], 1);
}