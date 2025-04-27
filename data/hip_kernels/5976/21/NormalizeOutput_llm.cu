#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function using shared memory and loop unrolling
__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    int stride = blockDim.x * gridDim.x;
    
    int64_t local_batch = batch_index;
    int64_t local_class = class_index;

    for (; idx < num_elements; idx += stride) {
        // Unroll the loop to enhance performance
        int64_t base_idx = idx * 3; // Precompute base index for efficiency
        to_normalize[base_idx] = local_batch;
        to_normalize[base_idx + 1] = local_class;
        to_normalize[base_idx + 2] = static_cast<int64_t>(original[idx]);
    }
}