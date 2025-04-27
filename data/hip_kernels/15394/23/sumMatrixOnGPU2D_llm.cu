#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixOnGPU2D(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    // Use shared memory for faster access
    __shared__ float tileA[32][32];
    __shared__ float tileB[32][32];

    if (ix < nx && iy < ny) {
        unsigned int localIdxX = threadIdx.x;
        unsigned int localIdxY = threadIdx.y;
      
        tileA[localIdxY][localIdxX] = MatA[iy * nx + ix];
        tileB[localIdxY][localIdxX] = MatB[iy * nx + ix];

        __syncthreads(); // Ensure all threads have copied to shared memory

        MatC[iy * nx + ix] = tileA[localIdxY][localIdxX] + tileB[localIdxY][localIdxX];
    }
}