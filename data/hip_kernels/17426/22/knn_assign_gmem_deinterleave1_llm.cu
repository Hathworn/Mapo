#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void knn_assign_gmem_deinterleave1(uint32_t length, uint16_t k, uint32_t *neighbors) {
    uint64_t sample = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit for out-of-bounds threads
    if (sample >= length) return;
    
    // Calculate base indices once
    uint64_t baseIndex = sample * k;
    uint64_t sourceIndex = sample * 2 * k;
    
    // Use shared memory for better performance if appropriate (limited by SM size)
    __shared__ uint32_t sharedNeighbors[1024]; // Example size

    if (sample % 2 == 1) {
        for (int i = threadIdx.x; i < k; i += blockDim.x) { // Work division among threads in a block
            neighbors[baseIndex + i] = neighbors[sourceIndex + i];
        }
    } else {
        uint64_t targetIndex = (length + sample) * k + k;
        for (int i = threadIdx.x; i < k; i += blockDim.x) { // Work division among threads in a block
            neighbors[targetIndex + i] = neighbors[sourceIndex + i];
        }
    }
}