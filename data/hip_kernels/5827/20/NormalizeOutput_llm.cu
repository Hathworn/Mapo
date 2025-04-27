#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll the loop and use a while loop for better performance
    while (idx < num_elements) {
        to_normalize[idx * 3] = batch_index;
        to_normalize[idx * 3 + 1] = class_index;
        to_normalize[idx * 3 + 2] = static_cast<int64_t>(original[idx]);
        idx += blockDim.x * gridDim.x;
    }
}