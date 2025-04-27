#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to increase performance
    extern __shared__ float shared_a[];
    
    if (idx < N) {
        // Load data into shared memory
        shared_a[threadIdx.x] = a[idx];
        __syncthreads();

        // Perform computation
        shared_a[threadIdx.x] *= shared_a[threadIdx.x];
        __syncthreads();

        // Write results back to global memory
        a[idx] = shared_a[threadIdx.x];
    }
}