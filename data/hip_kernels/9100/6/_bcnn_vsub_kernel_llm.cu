#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to optimize performance
__global__ void _bcnn_vsub_kernel(int n, float *a, float *b, float *y)
{
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;

    // Ensure i is less than n
    if (i < n) {
        // Load data into shared memory
        extern __shared__ float shared_a[];
        extern __shared__ float shared_b[];

        shared_a[threadIdx.x] = a[i];
        shared_b[threadIdx.x] = b[i];

        // Synchronize to ensure complete loading
        __syncthreads();

        // Perform subtraction using shared memory
        y[i] = shared_a[threadIdx.x] - shared_b[threadIdx.x];
    }
}