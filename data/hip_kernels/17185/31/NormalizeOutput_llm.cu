#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop through elements with stride to improve parallelism
    while (idx < num_elements) {
        // Unroll the loop by manually setting each index of to_normalize
        int64_t offset = idx * 3;
        to_normalize[offset] = batch_index;
        to_normalize[offset + 1] = class_index;
        to_normalize[offset + 2] = static_cast<int64_t>(original[idx]);
        
        // Move to the next element
        idx += blockDim.x * gridDim.x;
    }
}