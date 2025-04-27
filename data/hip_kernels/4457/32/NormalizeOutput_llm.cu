#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure only valid threads perform work
    if (idx < num_elements) {
        // Access global memory coalescing three elements at once
        int64_t* output = &to_normalize[idx * 3];
        output[0] = batch_index;
        output[1] = class_index;
        output[2] = static_cast<int64_t>(original[idx]);
    }
}