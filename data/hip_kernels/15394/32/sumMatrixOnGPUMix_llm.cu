#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPUMix(float *MatA, float *MatB, float *MatC, int nx, int ny) {
    // Calculate 2D block and grid indices
    unsigned int ix = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int iy = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (ix < nx && iy < ny) {
        // Calculate 1D global index for matrix
        unsigned int idx = iy * nx + ix;
        // Perform element-wise matrix addition
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}