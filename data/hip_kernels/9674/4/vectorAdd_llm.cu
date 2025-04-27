#include "hip/hip_runtime.h"
#include "includes.h"

// Optimizing global kernel function by introducing shared memory
__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    __shared__ float shared_A[256]; // Assuming a maximum of 256 threads per block
    __shared__ float shared_B[256]; // Assuming a maximum of 256 threads per block

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < numElements)
    {
        // Load data into shared memory
        shared_A[threadIdx.x] = A[i];
        shared_B[threadIdx.x] = B[i];
        __syncthreads(); // Ensure all threads have loaded their data

        // Perform computation using shared memory
        C[i] = shared_A[threadIdx.x] + shared_B[threadIdx.x];
    }
}