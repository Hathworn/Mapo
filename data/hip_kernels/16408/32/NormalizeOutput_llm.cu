#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Calculate the global thread index.
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Utilize shared memory for storing batch and class index to reduce global memory access.
    __shared__ int64_t s_batch_index;
    __shared__ int64_t s_class_index;

    if (threadIdx.x == 0) {
        s_batch_index = batch_index;
        s_class_index = class_index;
    }
    __syncthreads();

    // Iterate over elements with stride and use shared memory indexes.
    for (; idx < num_elements; idx += blockDim.x * gridDim.x) {
        int base_idx = idx * 3;
        to_normalize[base_idx]     = s_batch_index;
        to_normalize[base_idx + 1] = s_class_index;
        to_normalize[base_idx + 2] = static_cast<int64_t>(original[idx]);
    }
}