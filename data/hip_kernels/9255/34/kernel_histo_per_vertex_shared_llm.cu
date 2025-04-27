#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_histo_per_vertex_shared(unsigned int *ct, unsigned int *histo) {
    unsigned int tid_x = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int tid_y = threadIdx.y;
    if (tid_x >= constant_n_test_vertices) return;

    unsigned int vertex_offset = tid_x * constant_n_hits;
    unsigned int bin;
    unsigned int stride_block = blockDim.y;
    unsigned int ihit = vertex_offset + tid_y;
    unsigned int time_offset = tid_x * constant_n_time_bins;

    extern __shared__ unsigned int temp[];
    
    // Initialize shared memory
    for (unsigned int i = tid_y; i < constant_n_time_bins; i += stride_block) {
        temp[i] = 0;
    }
    __syncthreads();

    // Compute histogram in shared memory
    for (unsigned int i = ihit; i < vertex_offset + constant_n_hits; i += stride_block) {
        bin = ct[i];
        atomicAdd(&temp[bin - time_offset], 1);
    }
    __syncthreads();

    // Write results from shared memory to global memory
    for (unsigned int i = tid_y; i < constant_n_time_bins; i += stride_block) {
        atomicAdd(&histo[i + time_offset], temp[i]);
    }
}