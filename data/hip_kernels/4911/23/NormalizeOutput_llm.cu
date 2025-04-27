#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Unrolling loop for efficient memory access
    #pragma unroll
    for (; idx < num_elements; idx += stride) {
        int base_idx = idx * 3; // Calculate base index only once
        to_normalize[base_idx] = batch_index;
        to_normalize[base_idx + 1] = class_index;
        to_normalize[base_idx + 2] = static_cast<int64_t>(original[idx]);
    }
}