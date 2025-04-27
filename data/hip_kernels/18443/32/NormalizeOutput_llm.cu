#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for loop

    for (; idx < num_elements; idx += stride) {
        to_normalize[idx * 3] = batch_index; // Batch index assignment
        to_normalize[idx * 3 + 1] = class_index; // Class index assignment
        to_normalize[idx * 3 + 2] = static_cast<int64_t>(original[idx]); // Original element assignment
    }
}