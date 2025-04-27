#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Using shared memory to reduce global memory access
    __shared__ int shared_a, shared_b;
    
    // Load the values into shared memory per block
    shared_a = *a;
    shared_b = *b;
    
    // Ensure all threads are synchronized before proceeding
    __syncthreads();

    // Perform the addition using shared memory variables
    *c = shared_a + shared_b;
    printf("Result %d ", *c);
}