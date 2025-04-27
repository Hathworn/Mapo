#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access and thread mapping
__global__ void NormalizeOutput(const int num_elements, const int* __restrict__ original, int64_t* __restrict__ to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < num_elements) {
        // Use shared memory for frequent values to optimize access
        __shared__ int64_t s_batch_index, s_class_index;
        if (threadIdx.x == 0) {
            s_batch_index = batch_index;
            s_class_index = class_index;
        }
        __syncthreads();
        
        int64_t orig_value = static_cast<int64_t>(original[idx]);
        
        to_normalize[idx * 3] = s_batch_index;
        to_normalize[idx * 3 + 1] = s_class_index;
        to_normalize[idx * 3 + 2] = orig_value;
    }
}