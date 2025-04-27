#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    if (idx < num_elements) { // Ensure the thread is within bounds
        int base_index = idx * 3; // Compute base index for output
        to_normalize[base_index] = batch_index;
        to_normalize[base_index + 1] = class_index;
        to_normalize[base_index + 2] = static_cast<int64_t>(original[idx]);
    }
}