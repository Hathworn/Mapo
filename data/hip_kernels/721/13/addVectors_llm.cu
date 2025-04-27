#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addVectors(float *d_a, float *d_b, float *d_c, int size)
{
    // Cache size in shared memory to avoid repeated access to global memory
    __shared__ float shared_a[256];
    __shared__ float shared_b[256];

    int i = threadIdx.x + blockDim.x * blockIdx.x;

    if (i < size)
    {
        // Load data into shared memory for faster access
        shared_a[threadIdx.x] = d_a[i];
        shared_b[threadIdx.x] = d_b[i];
        __syncthreads(); // Ensure all threads have loaded their data

        // Perform vector addition using shared memory
        d_c[i] = shared_a[threadIdx.x] + shared_b[threadIdx.x];
    }
}