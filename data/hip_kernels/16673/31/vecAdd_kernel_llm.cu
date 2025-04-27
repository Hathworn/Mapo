#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecAdd_kernel(float *c, const float* a, const float* b)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilize shared memory to reduce global memory access
    __shared__ float shared_a[blockDim.x];
    __shared__ float shared_b[blockDim.x];
    
    // Load data into shared memory
    shared_a[threadIdx.x] = a[idx];
    shared_b[threadIdx.x] = b[idx];
    
    // Synchronize threads to ensure shared memory is loaded
    __syncthreads();
    
    // Perform computation using shared memory
    for (int i = 0; i < 500; i++) {
        // Accumulate in shared memory to avoid repeated global memory writes
        shared_a[threadIdx.x] += shared_b[threadIdx.x];
    }
    
    // Write result from shared memory to global memory
    c[idx] = shared_a[threadIdx.x];
}