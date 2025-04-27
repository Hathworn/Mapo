#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* __restrict__ original, int64_t* __restrict__ to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Unrolled loop for improved memory access pattern and coalescing
    for (; idx < num_elements; idx += stride) {
        int base = idx * 3;
        to_normalize[base] = batch_index;
        to_normalize[base + 1] = class_index;
        to_normalize[base + 2] = static_cast<int64_t>(original[idx]);
    }
}