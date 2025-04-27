#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Use shared memory for faster access
    __shared__ float sharedA[BLOCK_SIZE_Y][BLOCK_SIZE_X];
    __shared__ float sharedB[BLOCK_SIZE_Y][BLOCK_SIZE_X];

    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    // Load data into shared memory
    if (ix < nx && iy < ny) {
        sharedA[threadIdx.y][threadIdx.x] = MatA[idx];
        sharedB[threadIdx.y][threadIdx.x] = MatB[idx];
    }
    __syncthreads(); // Synchronize to ensure all threads have loaded their data

    // Compute result using shared memory
    if (ix < nx && iy < ny)
        MatC[idx] = sharedA[threadIdx.y][threadIdx.x] + sharedB[threadIdx.y][threadIdx.x];
}
```
