#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void knn_assign_gmem_deinterleave2(uint32_t length, uint16_t k, uint32_t *neighbors) {
    uint64_t sample = blockIdx.x * blockDim.x + threadIdx.x;
    sample *= 2;
    
    // Check if the current thread should proceed
    if (sample >= length) {
        return;
    }

    // Compute starting index for source and destination
    uint32_t src_index = (length + sample) * k + k;
    uint32_t dest_index = sample * k;

    // Use loop unrolling to improve performance
    #pragma unroll
    for (int i = 0; i < k; i++) {
        // Copy data from source to destination
        neighbors[dest_index + i] = neighbors[src_index + i];
    }
}