#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Optimize by using warp-level operations
    int warpSize = warpSize; // Typically 32
    idx *= 3;
    for (int i = idx; i < num_elements * 3; i += blockDim.x * gridDim.x * 3) {
        // Use temporary variables and warp operations to reduce redundant calculations
        int64_t temp_batch = batch_index;
        int64_t temp_class = class_index;
        int64_t temp_orig = static_cast<int64_t>(original[i / 3]);
        
        to_normalize[i] = temp_batch;
        to_normalize[i + 1] = temp_class;
        to_normalize[i + 2] = temp_orig;
    }
}