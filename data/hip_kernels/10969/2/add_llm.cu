#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c)
{
    // Use shared memory to reduce global memory accesses
    __shared__ int s_a, s_b;
    
    // Load inputs from global memory to shared memory
    s_a = a[blockIdx.x];
    s_b = b[blockIdx.x];
    
    // Ensure all loads to shared memory are completed
    __syncthreads();
    
    // Compute and store the result back to global memory
    c[blockIdx.x] = s_a + s_b;
}