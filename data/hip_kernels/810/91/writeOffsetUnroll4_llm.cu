#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void writeOffsetUnroll4(float *A, float *B, float *C, const int n, int offset)
{
    // Calculate the starting index for the current thread
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int k = i + offset;
    
    // Use shared memory to reduce global memory latency
    __shared__ float shared_A[1024]; // Assuming maximum block size is 1024
    __shared__ float shared_B[1024];

    // Loading data into shared memory
    if (i < n) {
        shared_A[threadIdx.x] = A[i];
        shared_B[threadIdx.x] = B[i];
    }
    __syncthreads();

    // Perform operations if within the bounds
    if (k + 3 * blockDim.x < n)
    {
        // Use shared memory for faster access
        C[k]              = shared_A[threadIdx.x]               + shared_B[threadIdx.x];
        C[k + blockDim.x]   = shared_A[threadIdx.x + blockDim.x]   + shared_B[threadIdx.x + blockDim.x];
        C[k + 2 * blockDim.x] = shared_A[threadIdx.x + 2 * blockDim.x] + shared_B[threadIdx.x + 2 * blockDim.x];
        C[k + 3 * blockDim.x] = shared_A[threadIdx.x + 3 * blockDim.x] + shared_B[threadIdx.x + 3 * blockDim.x];
    }
}