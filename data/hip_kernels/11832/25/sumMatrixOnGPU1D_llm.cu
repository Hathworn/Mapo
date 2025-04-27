#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU1D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Calculate global thread index
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use a stride loop to ensure all elements are processed
    int totalSize = nx * ny;
    while (idx < totalSize) {
        MatC[idx] = MatA[idx] + MatB[idx];
        idx += blockDim.x * gridDim.x; // Move to the next set of elements
    }
}