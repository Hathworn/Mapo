#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void buildCompactedIndexKernel(const unsigned* valid_indicator, const unsigned table_size, unsigned* compacted_index) {
    const auto idx = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Ensure idx is within bounds before performing operations
    if (idx < table_size) {
        // Use shared memory to minimize global memory access
        __shared__ unsigned shared_valid_indicator[1024]; // Adjust size as needed
        shared_valid_indicator[threadIdx.x] = valid_indicator[idx];
        
        unsigned offset = 0xffffffffu;

        // Check the valid indicator using shared memory
        if (shared_valid_indicator[threadIdx.x] > 0) {
            offset = compacted_index[idx] - 1;
        }
        
        compacted_index[idx] = offset;
    }
}