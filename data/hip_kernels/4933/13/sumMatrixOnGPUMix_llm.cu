#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPUMix(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Use 2D thread indexing for better readability and flexibility
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;

    if (ix < nx && iy < ny) {
        unsigned int idx = iy * nx + ix;
        // Sum the corresponding elements
        MatC[idx] = MatA[idx] + MatB[idx];
    }
}