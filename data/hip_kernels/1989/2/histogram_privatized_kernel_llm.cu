#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram_privatized_kernel(unsigned char *input, unsigned int *bins, unsigned int num_elements, unsigned int num_bins) {
    const int bx = blockIdx.x;
    const int bdx = blockDim.x;
    const int tx = threadIdx.x;
    const int gdx = gridDim.x;
    unsigned int tid = bx * bdx + tx;

    extern __shared__ unsigned int histo_s[]; // size is 3rd arg in <<< >>> of kernel
    // Initialize shared memory using block-level parallelism
    for (unsigned int bin_idx = tx; bin_idx < num_bins; bin_idx += bdx) {
        histo_s[bin_idx] = 0;
    }
    __syncthreads();

    const int bin_size = (num_elements - 1) / num_bins + 1;
    // Process elements using grid-stride loop
    for (unsigned int i = tid; i < num_elements; i += bdx * gdx) {
        int c = input[i] - 'a';
        if (c >= 0 && c < 26)
            atomicAdd(&(histo_s[c / bin_size]), 1);
    }
    __syncthreads();

    // Accumulate results to global memory
    for (unsigned int bin_idx = tx; bin_idx < num_bins; bin_idx += bdx) {
        atomicAdd(&(bins[bin_idx]), histo_s[bin_idx]);
    }
}