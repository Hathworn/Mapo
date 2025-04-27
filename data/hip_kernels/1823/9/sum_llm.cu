#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum(int *a, int *b, int *c)
{
    // Using shared memory for faster access
    extern __shared__ int shared_mem[];
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    // Load inputs into shared memory
    shared_mem[tid] = a[i] + b[i];
    __syncthreads();

    // Write result back to global memory
    c[i] = shared_mem[tid];
}