#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matMul(double *a, double *b, double *c)
{
    // Use shared memory to reduce global memory accesses
    __shared__ double sharedA[BLOCK_SIZE]; 
    __shared__ double sharedB[BLOCK_SIZE]; 

    const int NUM_THREAD_IN_BLOCK = blockDim.x * blockDim.y * blockDim.z;

    int bID = blockIdx.z * (gridDim.y * gridDim.x * NUM_THREAD_IN_BLOCK) + blockIdx.y * (gridDim.x * NUM_THREAD_IN_BLOCK) + (blockIdx.x * (blockDim.x * blockDim.y * blockDim.z));
    int tID = bID + ((blockDim.y * blockDim.x) * threadIdx.z) + (blockDim.x * threadIdx.y) + threadIdx.x;

    double sum = 0.0;

    // Loop over tiles
    for (int tile = 0; tile < MATRIX_J / BLOCK_SIZE; ++tile) {
        // Load elements into shared memory
        sharedA[threadIdx.x] = a[tID * MATRIX_J + tile * BLOCK_SIZE + threadIdx.x];
        sharedB[threadIdx.x] = b[(tile * BLOCK_SIZE + threadIdx.x) * MATRIX_J + tID];

        __syncthreads(); // Ensure all loads are complete

        // Compute partial result
        for (int i = 0; i < BLOCK_SIZE; i++) {
            sum += sharedA[i] * sharedB[i];
        }

        __syncthreads(); // Ensure all computations are complete
    }

    c[tID] = sum;
}