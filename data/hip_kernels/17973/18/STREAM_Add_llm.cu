#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void STREAM_Add(float *a, float *b, float *c, size_t len)
{
    // Use shared memory for efficient memory access
    extern __shared__ float shared_memory[];
    
    size_t idx = threadIdx.x + blockIdx.x * blockDim.x;
    size_t stride = blockDim.x * gridDim.x;

    while (idx < len) {
        // Load data into shared memory
        shared_memory[threadIdx.x] = a[idx] + b[idx];

        // Ensure all threads have written to shared memory
        __syncthreads();
        
        // Write result from shared memory to global memory
        c[idx] = shared_memory[threadIdx.x];
        
        idx += stride;
    }
}