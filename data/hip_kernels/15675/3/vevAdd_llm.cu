#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vevAdd(int N, float *a, float *b, float *c)
{
    // Use shared memory for improved performance
    extern __shared__ float shared_a[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Load data into shared memory
    if (idx < N)
    {
        shared_a[threadIdx.x] = a[idx];
        c[idx] = shared_a[threadIdx.x] + b[idx];
    }
}