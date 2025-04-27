#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void knn_assign_gmem_deinterleave2( uint32_t length, uint16_t k, uint32_t *neighbors) {
    // Calculate initial sample index
    uint64_t sample = blockIdx.x * blockDim.x + threadIdx.x;
    sample *= 2;
    
    // Early exit if sample is out of range
    if (sample >= length) return;

    // Use a pointer offset to improve memory access pattern
    uint32_t *source = &neighbors[(length + sample) * k + k];
    uint32_t *dest = &neighbors[sample * k];

    // Unroll loop to reduce loop overhead
    #pragma unroll
    for (int i = 0; i < k; i++) {
        dest[i] = source[i];
    }
}