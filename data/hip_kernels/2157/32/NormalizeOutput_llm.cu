#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Use shared memory to minimize redundant global memory access
    extern __shared__ int s_original[];
    int tid = threadIdx.x;

    // Calculate global index
    int global_idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load data into shared memory
    if (global_idx < num_elements) {
        s_original[tid] = original[global_idx];
    }
    __syncthreads();

    for (; global_idx < num_elements; global_idx += blockDim.x * gridDim.x) {
        // Use shared memory value if within bound, otherwise reload from global memory
        int original_value = (global_idx < num_elements) ? s_original[tid] : original[global_idx];
        to_normalize[global_idx * 3] = batch_index;
        to_normalize[global_idx * 3 + 1] = class_index;
        to_normalize[global_idx * 3 + 2] = static_cast<int64_t>(original_value);

        // Update global index for next loop iteration
        global_idx += blockDim.x * gridDim.x;

        // Implicit barrier: sync threads before next shared memory access
        __syncthreads();

        if (global_idx < num_elements) {
            s_original[tid] = original[global_idx];
        }
        __syncthreads();
    }
}