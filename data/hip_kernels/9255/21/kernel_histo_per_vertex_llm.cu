#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_histo_per_vertex( unsigned int *ct, unsigned int *histo) {

    // Calculate unique id for each thread in the grid
    unsigned int tid_x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int tid_y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check if thread is within bounds
    if (tid_x >= constant_n_test_vertices) return;

    unsigned int vertex_offset = tid_x * constant_n_hits;
    unsigned int bin;
    unsigned int stride = blockDim.y * gridDim.y;
    unsigned int ihit = vertex_offset + tid_y;

    // Loop through hits with a stride to access memory efficiently
    while (ihit < vertex_offset + constant_n_hits) {
        bin = ct[ihit];
        atomicAdd(&histo[bin], 1);  // Atomic add to avoid race conditions
        ihit += stride;
    }
}