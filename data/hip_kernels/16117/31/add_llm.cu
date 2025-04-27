#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int* c)
{
    // Using shared memory to cache input values
    __shared__ int a_shared, b_shared;
    int tid = threadIdx.x;

    // Load data into shared memory
    if (tid == 0) {
        a_shared = a;
        b_shared = b;
    }
    __syncthreads();

    // Perform addition using shared memory values
    if (tid == 0) {
        *c = a_shared + b_shared;
    }
}