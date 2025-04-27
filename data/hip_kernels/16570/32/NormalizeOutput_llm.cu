#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Iterate over stride instead of recalculating each time
    for (; idx < num_elements; idx += stride) {
        int offset = idx * 3; // Calculate offset once per iteration
        to_normalize[offset] = batch_index;
        to_normalize[offset + 1] = class_index;
        to_normalize[offset + 2] = static_cast<int64_t>(original[idx]);
    }
}