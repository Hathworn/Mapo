#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Calculate global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Utilize shared memory to reduce global memory access latency
    __shared__ float shared_a[256]; // Assuming blockDim.x <= 256
    if (idx < N) {
        // Load data into shared memory
        shared_a[threadIdx.x] = a[idx];
        __syncthreads();
        // Perform computation
        shared_a[threadIdx.x] = shared_a[threadIdx.x] * shared_a[threadIdx.x];
        __syncthreads();
        // Store data back to global memory
        a[idx] = shared_a[threadIdx.x];
    }
}