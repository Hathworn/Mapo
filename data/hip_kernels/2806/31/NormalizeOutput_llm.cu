#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Precompute constants to minimize repeated calculations.
    const int stride = blockDim.x * gridDim.x;
    const int offset_batch_index = batch_index * 3;
    const int offset_class_index = class_index * 3 + 1;

    for (int idx = blockIdx.x * blockDim.x + threadIdx.x; idx < num_elements; idx += stride) {
        int base_idx = idx * 3;
        to_normalize[base_idx] = offset_batch_index;
        to_normalize[base_idx + 1] = offset_class_index;
        to_normalize[base_idx + 2] = static_cast<int64_t>(original[idx]);
    }
}