#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BackwardSoftmax(float *A, float *dA, int nColsdZ, float *dZ)
{
    // Use shared memory to reduce repeated global memory accesses
    __shared__ float sharedA[1024];
    __shared__ float shareddA[1024];

    int row = threadIdx.x;
    int col = blockIdx.x;

    // Load data into shared memory
    sharedA[row] = A[row * nColsdZ + col];
    shareddA[row] = dA[row * nColsdZ + col];

    __syncthreads();

    // Compute using shared memory
    dZ[row * nColsdZ + col] = shareddA[row] * sharedA[row] * (1 - sharedA[row]);
}