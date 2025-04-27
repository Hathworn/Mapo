#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void glcm_calculation_135(int *A, int *glcm, const int nx, const int ny, int max) {
    // Compute global thread IDs
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    
    // Calculate unique index for the 1D array
    unsigned int idx = iy * nx + ix;
    
    // Check if within bounds
    if (ix >= 0 && ix < nx - 1 && iy >= 0 && iy < ny - 1) {
        int k = max * A[idx] + A[idx + nx - 1]; // 135-degree offset
        atomicAdd(&glcm[k], 1); // Atomic add for safe parallel updates
    }
    __syncthreads(); // Synchronize all threads
}