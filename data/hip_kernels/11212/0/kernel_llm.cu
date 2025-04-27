#include "hip/hip_runtime.h"
#include "includes.h"

#define N   (1024*1024)
#define FULL_DATA_SIZE   (N*20)

__global__ void kernel(int *a, int *b, int *c) {
    // Calculate global index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Use shared memory to improve data locality and reduce global memory accesses
    extern __shared__ int shared[];
    int* sharedA = shared;
    int* sharedB = shared + blockDim.x;

    if (idx < N) {
        int localIdx = threadIdx.x;

        // Load elements to shared memory
        sharedA[localIdx] = a[idx];
        sharedB[localIdx] = b[idx];
        __syncthreads();

        // Handle edge cases within shared memory block
        int idx1 = (localIdx + 1) % blockDim.x;
        int idx2 = (localIdx + 2) % blockDim.x;

        // Compute as and bs using shared memory
        float as = (sharedA[localIdx] + sharedA[idx1] + sharedA[idx2]) / 3.0f;
        float bs = (sharedB[localIdx] + sharedB[idx1] + sharedB[idx2]) / 3.0f;

        // Store result in global memory
        c[idx] = (as + bs) / 2.0f;
    }
}