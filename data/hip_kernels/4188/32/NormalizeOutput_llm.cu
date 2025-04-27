#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Calculate unique index for each thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Iterate over data with stride to ensure all elements are processed
    for (; idx < num_elements; idx += stride) {
        // Assign values to normalized output
        int64_t* dest = to_normalize + idx * 3;  // Pointer arithmetic for direct access
        dest[0] = batch_index;
        dest[1] = class_index;
        dest[2] = static_cast<int64_t>(original[idx]);
    }
}