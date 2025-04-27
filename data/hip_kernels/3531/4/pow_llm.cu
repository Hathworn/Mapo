#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized pow kernel function
__global__ void pow(float *a, float *b, float *c)
{
    // Using shared memory to reduce global memory access
    __shared__ float shared_a;
    __shared__ float shared_b;

    // Load data into shared memory
    shared_a = *a;
    shared_b = *b;

    // Ensure all threads have loaded shared memory
    __syncthreads();

    // Compute power using shared memory values
    *c = powf(shared_a, shared_b);
}