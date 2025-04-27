#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int *a, int *b, int *c)
{
    extern __shared__ int shared_mem[];
    int idx = threadIdx.x;

    // Efficiently copy data to shared memory
    shared_mem[idx] = idx;
    __syncthreads();

    // Compute addition using shared memory
    int val = shared_mem[idx];
    a[idx] = val;
    b[idx] = val;
    c[idx] = a[idx] + b[idx];
}