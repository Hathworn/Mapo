#include "hip/hip_runtime.h"
#include "includes.h"

#define N 128

__global__ void calc_freq(int *freq, int file_size, char *buffer, int total_threads){
    // Allocate shared memory for block-level frequency accumulation
    __shared__ int shared_freq[N];
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int local_idx = threadIdx.x;
    
    // Initialize shared memory
    if (local_idx < N) {
        shared_freq[local_idx] = 0;
    }
    __syncthreads();
    
    // Calculate per-thread local frequency
    for (int i = idx; i < file_size; i += total_threads) {
        atomicAdd(&shared_freq[buffer[i]], 1);
    }
    __syncthreads();
    
    // Reduce from shared memory to global memory
    if (local_idx < N) {
        atomicAdd(&freq[local_idx], shared_freq[local_idx]);
    }
}