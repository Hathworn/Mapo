#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fitness_kernel(int* chromosome, int* collision) {
    unsigned int tid = threadIdx.x;
    unsigned int bid = blockIdx.x;
    int temp = chromosome[bid];
    extern __shared__ int cache[]; // Shared memory for intermediate results

    // Parallel initialization
    cache[tid] = 0;
    if (tid < bid) {
        int d = abs(temp - chromosome[tid]);
        cache[tid] = (d == 0 || d == (bid - tid)) ? 1 : 0;
    }
    __syncthreads();

    // Efficient reduction using loop unrolling
    for (unsigned int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (tid < i) {
            cache[tid] += cache[tid + i];
        }
        __syncthreads();
    }

    // Store the result into global memory
    if (tid == 0) {
        atomicAdd(collision, cache[0]);
    }
}