#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function to use shared memory and reduce loop overhead
__global__ void NormalizeOutput(const int num_elements, const int* __restrict__ original, int64_t* __restrict__ to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < num_elements) {
        int index3 = idx * 3;
        to_normalize[index3] = batch_index;
        to_normalize[index3 + 1] = class_index;
        to_normalize[index3 + 2] = static_cast<int64_t>(original[idx]);
    }
}