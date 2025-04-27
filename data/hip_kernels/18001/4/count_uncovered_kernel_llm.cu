#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void count_uncovered_kernel(size_t batch_size, size_t num_nodes, uint32_t *d_rrr_index, uint32_t *d_rrr_sets, char *d_mask, uint32_t *d_counters) {
    int pos = threadIdx.x + blockDim.x * blockIdx.x;

    if (pos < batch_size) {
        uint32_t set = d_rrr_index[pos];
        // Improved memory access, load once
        char mask_set = d_mask[set];
        if (mask_set != 1) {
            uint32_t v = d_rrr_sets[pos];
            // Using atomic to ensure correct concurrent updates
            atomicAdd(d_counters + v, 1);
        }
    }
}