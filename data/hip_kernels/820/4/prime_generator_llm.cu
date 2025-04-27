#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prime_generator(int *input, int *prime_list, int *total_input, int *seed) {
    // Using shared memory to reduce global memory access.
    __shared__ int shared_seed;
    if (threadIdx.x == 0) {
        shared_seed = seed[0];
    }
    __syncthreads();

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int primeno = prime_list[i];
    int total = shared_seed * shared_seed;

    // Using stride loop to optimize memory access in case grid size is smaller than total.
    for (int k = shared_seed + i; k < total; k += blockDim.x * gridDim.x) {
        if (k % primeno == 0) {
            input[k] = 1;
        }
    }
}