#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Calculate the global index for the current thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a loop with stride only if necessary and unrolling for better performance
    while (idx < num_elements) {
        // Store values into the output array
        to_normalize[idx * 3] = batch_index;
        to_normalize[idx * 3 + 1] = class_index;
        to_normalize[idx * 3 + 2] = static_cast<int64_t>(original[idx]);
        
        // Increment the index for the next iteration, moving in strides
        idx += blockDim.x * gridDim.x;
    }
}