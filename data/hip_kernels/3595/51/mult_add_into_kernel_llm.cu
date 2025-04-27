#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Use shared memory to efficiently handle access
    __shared__ float shared_a[256];  // Assumes blockDim.x <= 256
    __shared__ float shared_b[256];  // Assumes blockDim.x <= 256

    // Load data into shared memory
    if(i < n) {
        shared_a[threadIdx.x] = a[i];
        shared_b[threadIdx.x] = b[i];
        __syncthreads();

        // Perform computation using shared memory
        c[i] += shared_a[threadIdx.x] * shared_b[threadIdx.x];
    }
}