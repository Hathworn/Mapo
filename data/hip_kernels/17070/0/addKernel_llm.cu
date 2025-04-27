#include "hip/hip_runtime.h"
#include "includes.h"

// Helper function for using CUDA to add vectors in parallel.
__global__ void addKernel(int* c, const int* a, const int* b, int size) {
    // Use shared memory for coalesced memory access
    extern __shared__ int shared_a[];
    extern __shared__ int shared_b[];

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    // Load data into shared memory
    if (i < size) {
        shared_a[tid] = a[i];
        shared_b[tid] = b[i];
    }
    __syncthreads();  // Synchronize threads

    // Perform vector addition
    if (i < size) {
        c[i] = shared_a[tid] + shared_b[tid];
    }
}