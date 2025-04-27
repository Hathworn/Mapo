#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Use shared memory for MatC to reduce global memory accesses
    extern __shared__ float sMatC[];

    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    if (ix < nx && iy < ny) {
        // Load data into shared memory
        sMatC[threadIdx.y * blockDim.x + threadIdx.x] = MatA[idx] + MatB[idx];
        __syncthreads();

        // Store result back to global memory
        MatC[idx] = sMatC[threadIdx.y * blockDim.x + threadIdx.x];
    }
}