#include "hip/hip_runtime.h"
#include "includes.h"

// Device input vectors
int *d_a;
// Device output vector
int *d_b

__global__ void naivePrefixSum(int *A, int *B, int size, int iteration) {
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for faster access
    extern __shared__ int sharedB[];
    if (index < size) {
        sharedB[threadIdx.x] = B[index];
        __syncthreads();

        // Check and compute prefix sum
        if (threadIdx.x >= (1 << (iteration - 1)))
            A[index] = sharedB[threadIdx.x] + sharedB[threadIdx.x - (1 << (iteration - 1))];
        else
            A[index] = sharedB[threadIdx.x];
    }
}