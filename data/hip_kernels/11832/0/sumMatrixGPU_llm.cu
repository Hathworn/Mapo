#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumMatrixGPU(float *MatA, float *MatB, float *MatC, int nx, int ny)
{
    // Use shared memory to optimize memory access patterns
    __shared__ float shared_A[BLOCK_DIM_Y][BLOCK_DIM_X];
    __shared__ float shared_B[BLOCK_DIM_Y][BLOCK_DIM_X];

    // Calculate local thread indices
    unsigned int local_ix = threadIdx.x;
    unsigned int local_iy = threadIdx.y;

    // Calculate global indices
    unsigned int ix = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int iy = threadIdx.y + blockIdx.y * blockDim.y;
    unsigned int idx = iy * nx + ix;

    // Load data into shared memory if within bounds
    if (ix < nx && iy < ny) {
        shared_A[local_iy][local_ix] = MatA[idx];
        shared_B[local_iy][local_ix] = MatB[idx];
    }
    __syncthreads(); // Ensure all threads have loaded their data

    // Calculate the result using shared memory
    if (ix < nx && iy < ny) {
        MatC[idx] = shared_A[local_iy][local_ix] + shared_B[local_iy][local_ix];
    }
}