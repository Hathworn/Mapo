#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    // Load values into shared memory for faster access
    __shared__ int shared_a, shared_b;

    // Only the first thread in the block loads data to shared memory
    if (threadIdx.x == 0) { 
        shared_a = *a;
        shared_b = *b;
    }
    
    __syncthreads();  // Ensure all threads see loaded values

    // First thread computes the result
    if (threadIdx.x == 0) {
        *c = shared_a + shared_b;
    }
}