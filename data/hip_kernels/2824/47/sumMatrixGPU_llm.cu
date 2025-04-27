#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Use shared memory to reduce global memory access
    extern __shared__ float sharedMem[];
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    if (ix < nx && iy < ny) {
        // Load data into shared memory
        sharedMem[threadIdx.y * blockDim.x + threadIdx.x] = MatA[idx] + MatB[idx];
        __syncthreads(); // Ensure all loads are complete
        
        // Write the result back to global memory
        MatC[idx] = sharedMem[threadIdx.y * blockDim.x + threadIdx.x];
    }
}