#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a while loop for improved performance by reducing control overhead
    while (idx < num_elements) {
        int64_t* output_ptr = to_normalize + idx * 3; // Pre-calculate the output address
        output_ptr[0] = batch_index;
        output_ptr[1] = class_index;
        output_ptr[2] = static_cast<int64_t>(original[idx]);
        idx += blockDim.x * gridDim.x;
    }
}