#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_histo_one_thread_one_vertex( unsigned int *ct, unsigned int *histo ){

    // Unique thread id
    unsigned int tid_x = threadIdx.x + blockDim.x * blockIdx.x;

    // Calculate start index for each vertex
    unsigned int start_idx = tid_x * constant_n_hits;

    // Loop for each hit in the vertex
    for (unsigned int ihit = 0; ihit < constant_n_hits; ihit++) {
        unsigned int bin = start_idx + ihit;
        if (bin < constant_n_test_vertices * constant_n_hits) {
            // Atomic update to histogram
            atomicAdd(&histo[ct[bin]], 1);
        }
    }
}