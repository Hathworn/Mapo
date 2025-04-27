#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use shared memory for faster access
    __shared__ int shared_a[1024];
    __shared__ int shared_b[1024];

    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Load elements into shared memory
    shared_a[threadIdx.x] = a[i];
    shared_b[threadIdx.x] = b[i];
    __syncthreads();

    // Compute the result using shared memory
    c[i] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
}