#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram_kernel(unsigned int* input, unsigned int* bins, unsigned int num_elements, unsigned int num_bins) {
    extern __shared__ unsigned int bins_s[];

    int thid = threadIdx.x;
    // Initialize shared memory bins to zero
    for (int i = thid; i < num_bins; i += blockDim.x) {
        bins_s[i] = 0u;
    }
    __syncthreads();

    // Histogram calculation in shared memory
    for (int i = blockIdx.x * blockDim.x + thid; i < num_elements; i += blockDim.x * gridDim.x) {
        atomicAdd(&(bins_s[input[i]]), 1);
    }
    __syncthreads();

    // Accumulate the shared memory bins into global memory
    for (int i = thid; i < num_bins; i += blockDim.x) {
        atomicAdd(&(bins[i]), bins_s[i]);
    }
}