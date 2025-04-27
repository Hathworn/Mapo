#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int *a, int *b, int *c) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    if (idx < N) {
        // Use shared memory to minimize global memory access
        __shared__ int shared_a[256];
        __shared__ int shared_b[256];

        int localIdx = threadIdx.x;

        // Load data into shared memory
        shared_a[localIdx] = a[idx];
        shared_b[localIdx] = b[idx];
        __syncthreads(); // Ensure all threads have written to shared memory

        // Compute indices
        int idx1 = (localIdx + 1) % 256;
        int idx2 = (localIdx + 2) % 256;

        // Perform calculations using shared memory
        float as = (shared_a[localIdx] + shared_a[idx1] + shared_a[idx2]) / 3.0f;
        float bs = (shared_b[localIdx] + shared_b[idx1] + shared_b[idx2]) / 3.0f;

        // Store result in global memory
        c[idx] = (as + bs) / 2;
    }
}