#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void glcm_calculation_225(int *A, int *glcm, const int nx, const int ny, int max) {
    // Compute global thread index based on block and thread indices
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;
    
    // Check if the thread index is within bounds
    if (ix >= nx || iy >= ny) return;

    // Optimize: Loop unrolling and conditional check before entering atomicAdd
    int k = 0;
    if (blockIdx.x >= 1 && idx > blockIdx.x * nx) {
        k = max * A[idx] + A[idx - (nx + 1)];
        // Atomic operation to avoid race conditions
        atomicAdd(&glcm[k], 1);
    }

    __syncthreads(); // Synchronize threads within a block
}