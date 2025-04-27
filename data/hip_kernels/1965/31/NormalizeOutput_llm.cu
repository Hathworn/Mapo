#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel to normalize output
__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x; 

    // Use a loop unrolling technique to improve memory access pattern
    for (; idx < num_elements; idx += blockDim.x * gridDim.x) {
        // Directly update to_normalize array with computed indices
        int base_idx = idx * 3;
        to_normalize[base_idx] = batch_index;
        to_normalize[base_idx + 1] = class_index;
        to_normalize[base_idx + 2] = static_cast<int64_t>(original[idx]);
    }
}