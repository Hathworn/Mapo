#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c) {
    // Use shared memory to reduce global memory accesses
    __shared__ int temp; 

    // Compute sum in a single thread to minimize thread divergence
    if (threadIdx.x == 0) {
        temp = a + b;
    }

    // Ensure all threads see the updated shared memory value
    __syncthreads();

    // Write result from shared memory back to global memory
    if (threadIdx.x == 0) {
        *c = temp;
    }
}