#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_histo_per_vertex_shared(unsigned int *ct, unsigned int *histo) {
    // Get unique id for each thread in each block
    unsigned int tid_x = threadIdx.x + blockDim.x * blockIdx.x;
    unsigned int tid_y = threadIdx.y + blockDim.y * blockIdx.y;

    if (tid_x >= constant_n_test_vertices) return;

    unsigned int vertex_offset = tid_x * constant_n_hits;
    unsigned int stride_block = blockDim.y;
    unsigned int ihit = vertex_offset + tid_y;
    unsigned int time_offset = tid_x * constant_n_time_bins;

    unsigned int local_ihit = threadIdx.y;

    // Use shared memory dynamically allocated
    extern __shared__ unsigned int temp[];

    // Simplified initialization of shared memory
    for (unsigned int i = local_ihit; i < constant_n_time_bins; i += stride_block) {
        temp[i] = 0;
    }
    
    __syncthreads();

    // Process hits with the step size across threads
    unsigned int stride = blockDim.y * gridDim.y;
    for (; ihit < vertex_offset + constant_n_hits; ihit += stride) {
        unsigned int bin = ct[ihit];
        atomicAdd(&temp[bin - time_offset], 1);
    }

    __syncthreads();

    // Atomic addition of results from shared memory to global memory
    local_ihit = threadIdx.y;
    for (unsigned int i = local_ihit; i < constant_n_time_bins; i += stride_block) {
        atomicAdd(&histo[i + time_offset], temp[i]);
    }
}