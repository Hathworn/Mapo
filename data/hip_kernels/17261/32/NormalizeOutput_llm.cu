#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Use shared memory for storing batch and class indices to avoid redundant writes
    __shared__ int64_t shared_batch_index;
    __shared__ int64_t shared_class_index;
    
    if(threadIdx.x == 0) {
        shared_batch_index = batch_index;
        shared_class_index = class_index;
    }
    __syncthreads();
    
    int global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    for (int idx = global_idx; idx < num_elements; idx += blockDim.x * gridDim.x) {
        to_normalize[idx * 3] = shared_batch_index;
        to_normalize[idx * 3 + 1] = shared_class_index;
        to_normalize[idx * 3 + 2] = static_cast<int64_t>(original[idx]);
    }
}