#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a conditional to avoid out-of-bound access
    if (idx < num_elements) {
        // Assign values to output array
        to_normalize[idx * 3] = batch_index;
        to_normalize[idx * 3 + 1] = class_index;
        to_normalize[idx * 3 + 2] = static_cast<int64_t>(original[idx]);
    }
}