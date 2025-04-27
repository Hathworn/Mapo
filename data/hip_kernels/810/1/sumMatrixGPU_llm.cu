#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    if (ix < nx && iy < ny) {
        // Load matrix elements to shared memory to exploit memory coalescing
        __shared__ float sharedMatA[32][32];
        __shared__ float sharedMatB[32][32];

        sharedMatA[threadIdx.y][threadIdx.x] = MatA[idx];
        sharedMatB[threadIdx.y][threadIdx.x] = MatB[idx];

        __syncthreads(); // Ensure all elements are loaded before computation

        // Write the result to global memory
        MatC[idx] = sharedMatA[threadIdx.y][threadIdx.x] + sharedMatB[threadIdx.y][threadIdx.x];
    }
}