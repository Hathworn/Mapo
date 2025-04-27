#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_histo_stride(unsigned int *ct, unsigned int *histo) {
    // Calculate the global thread index
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory to reduce contention on histo
    extern __shared__ unsigned int shared_histo[];
    int tid = threadIdx.x;
    
    // Initialize shared memory histogram
    for (int j = tid; j < constant_bin_count; j += blockDim.x) {
        shared_histo[j] = 0;
    }
    __syncthreads();

    // Accumulate histogram in shared memory
    while (i < constant_n_hits * constant_n_test_vertices) {
        atomicAdd(&shared_histo[ct[i]], 1);
        i += stride;
    }
    __syncthreads();

    // Reduce shared memory histogram to global memory
    for (int j = tid; j < constant_bin_count; j += blockDim.x) {
        atomicAdd(&histo[j], shared_histo[j]);
    }
}