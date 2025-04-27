#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel
__global__ void knn_assign_gmem_deinterleave1(uint32_t length, uint16_t k, uint32_t *neighbors) {
    uint64_t sample = blockIdx.x * blockDim.x + threadIdx.x;
    // Early exit if out of range
    if (sample >= length) return;

    // Index calculation for odd and even samples
    uint32_t srcIndex = sample * 2 * k;
    if (sample % 2 == 1) {
        for (int i = 0; i < k; i++) {
            neighbors[sample * k + i] = neighbors[srcIndex + i];
        }
    } else {
        uint32_t destIndex = (length + sample) * k + k;
        for (int i = 0; i < k; i++) {
            neighbors[destIndex + i] = neighbors[srcIndex + i];
        }
    }
}