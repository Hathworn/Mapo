#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global function
__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Cache batch_index and class_index in registers for faster access
    int64_t batch_idx = batch_index;
    int64_t class_idx = class_index;
    
    // Calculate stride and iterate over elements in stride manner to balance load
    int stride = blockDim.x * gridDim.x;
    for (int idx = blockIdx.x * blockDim.x + threadIdx.x; idx < num_elements; idx += stride) {
        int base_idx = idx * 3;
        
        // Perform memory coalesced writes
        to_normalize[base_idx] = batch_idx;
        to_normalize[base_idx + 1] = class_idx;
        to_normalize[base_idx + 2] = static_cast<int64_t>(original[idx]);
    }
}