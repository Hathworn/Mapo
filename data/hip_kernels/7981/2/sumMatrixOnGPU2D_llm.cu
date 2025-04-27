#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixOnGPU2D(float *A, float *B, float *C, const int nx, const int ny)
{
    // Use shared memory to reduce global memory accesses
    __shared__ float sA[32][32];
    __shared__ float sB[32][32];

    int ix = blockIdx.x * blockDim.x + threadIdx.x;
    int iy = blockIdx.y * blockDim.y + threadIdx.y;

    if (ix < nx && iy < ny) 
    {
        int idx = iy * nx + ix;
        sA[threadIdx.y][threadIdx.x] = A[idx];
        sB[threadIdx.y][threadIdx.x] = B[idx];
        
        __syncthreads(); // Ensure all data is loaded into shared memory
        
        // Perform addition in shared memory
        C[idx] = sA[threadIdx.y][threadIdx.x] + sB[threadIdx.y][threadIdx.x];
    }
}