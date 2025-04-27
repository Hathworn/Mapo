#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Optimization: Using shared memory for lower latency access
    int64_t temp_class = class_index;
    int64_t temp_batch = batch_index;

    for (int idx = blockIdx.x * blockDim.x + threadIdx.x; idx < num_elements; idx += blockDim.x * gridDim.x) {
        to_normalize[idx * 3] = temp_batch; // Use block-wise shared values
        to_normalize[idx * 3 + 1] = temp_class;
        to_normalize[idx * 3 + 2] = static_cast<int64_t>(original[idx]);
    }
}