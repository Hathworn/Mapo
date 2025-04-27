```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram_kernel_optimized(unsigned int* input, unsigned int* bins, unsigned int num_elements, unsigned int num_bins) {
    // Use shared memory for bin storage
    extern __shared__ unsigned int bins_s[];

    // Initialize shared memory bins using parallel threads
    int thid = threadIdx.x;
    for (int i = thid; i < num_bins; i += blockDim.x) {
        bins_s[i] = 0u;
    }
    __syncthreads();

    // Efficient histogram calculation using per-thread accumulation
    unsigned int element = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int accumulator = 0;
    unsigned int prev_index = 0;

    while (element < num_elements) {
        unsigned int curr_index = input[element];

        if (curr_index != prev_index) {
            atomicAdd(&(bins_s[prev_index]), accumulator);
            accumulator = 1;
            prev_index = curr_index;
        } else {
            accumulator++;
        }
        element += blockDim.x * gridDim.x;
    }

    // Add remaining accumulation
    if (accumulator > 0) {
        atomicAdd(&(bins_s[prev_index]), accumulator);
    }
    __syncthreads();

    // Transfer results from shared memory bins to global memory bins
    for (int i = thid; i < num_bins; i += blockDim.x) {
        atomicAdd(&(bins[i]), bins_s[i]);
    }
}