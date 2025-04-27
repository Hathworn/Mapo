#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Use shared memory where possible if needed for optimizations
    __shared__ int64_t shared_batch_index;
    __shared__ int64_t shared_class_index;
    if (threadIdx.x == 0) {
        shared_batch_index = batch_index;
        shared_class_index = class_index;
    }
    __syncthreads();
    
    // Optimize loop by using less arithmetic calculations
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    while (idx < num_elements) {
        int target_idx = idx * 3;
        to_normalize[target_idx] = shared_batch_index;         // Use shared memory value
        to_normalize[target_idx + 1] = shared_class_index;     // Use shared memory value
        to_normalize[target_idx + 2] = static_cast<int64_t>(original[idx]);
        idx += stride;
    }
}