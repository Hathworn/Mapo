#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop unrolling and stride optimization
    for (int stride = idx; stride < num_elements; stride += blockDim.x * gridDim.x) {
        int base_index = stride * 3;
        to_normalize[base_index] = batch_index;
        to_normalize[base_index + 1] = class_index;
        to_normalize[base_index + 2] = static_cast<int64_t>(original[stride]);
    }
}