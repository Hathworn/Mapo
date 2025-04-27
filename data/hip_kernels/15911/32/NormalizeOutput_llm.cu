#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Calculate global thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use while loop for coalesced memory access and reduce loop control overhead
    while (idx < num_elements) {
        int base_idx = idx * 3;  // Calculate base index for memory access
        to_normalize[base_idx] = batch_index;  // Set batch index
        to_normalize[base_idx + 1] = class_index;  // Set class index
        to_normalize[base_idx + 2] = static_cast<int64_t>(original[idx]);  // Set original value
        idx += blockDim.x * gridDim.x;  // Move to next set of data
    }
}