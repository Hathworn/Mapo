#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
__global__ void add(int n, float *a, float *b, float *sum)
{
    // Use a shared memory cache to optimize memory access
    extern __shared__ float shared_a[];
    extern __shared__ float shared_b[];

    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n)
    {
        // Load data into shared memory
        shared_a[threadIdx.x] = a[i];
        shared_b[threadIdx.x] = b[i];

        __syncthreads();

        // Use shared memory for computation
        sum[i] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
    }
}