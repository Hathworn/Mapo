#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop unrolling for more efficient memory access
    int stride = blockDim.x * gridDim.x;
    while (idx < num_elements) {
        int base_idx = idx * 3;
        to_normalize[base_idx] = batch_index;
        to_normalize[base_idx + 1] = class_index;
        to_normalize[base_idx + 2] = static_cast<int64_t>(original[idx]);
        idx += stride;
    }
}