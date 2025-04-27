```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_reduction(int *shared_var, int *input_values, int N, int iters)
{
    __shared__ int local_mem[256]; // Shared memory for local block reduction
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int local_tid = threadIdx.x;
    
    // Load data into shared memory
    if (tid < N) {
        local_mem[local_tid] = input_values[tid];
    }
    
    // Ensure all threads have written to shared memory before reduction
    __syncthreads();
    
    // Perform reduction only if needed
    for (int iter = 0; iter < iters; iter++) {
        for (int s = (blockDim.x >> 1); s > 0; s >>= 1) {
            if (local_tid < s && tid + s < N) {
                local_mem[local_tid] += local_mem[local_tid + s];
            }
            __syncthreads(); // Synchronize within thread block
        }
        
        // Use atomic add to accumulate block sum to global variable
        if (local_tid == 0) {
            atomicAdd(shared_var, local_mem[0]);
        }
        
        // Ensure all threads are done with atomic operation before next iteration
        __syncthreads();
    }
}