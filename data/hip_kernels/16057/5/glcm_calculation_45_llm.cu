#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void glcm_calculation_45(int *A, int *glcm, const int nx, const int ny, int max) {
    int ix = threadIdx.x + blockIdx.x * blockDim.x;
    int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;
    
    // Iterate only within valid indices and grid boundaries
    if (ix > 0 && ix < nx && iy < ny) {  // Ensure threads process valid elements
        int currentBlock = blockIdx.x;
        if (idx < nx * (currentBlock + 1) - 1) {  // Check within block valid range
            int k = max * A[idx] + A[idx - (nx - 1)];
            atomicAdd(&glcm[k], 1);  // Safely update glcm with atomic operation
        }
    }
}