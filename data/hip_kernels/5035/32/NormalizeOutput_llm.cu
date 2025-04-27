#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Cache common values to register for faster access
    int64_t cache_batch_index = batch_index;
    int64_t cache_class_index = class_index;

    // Use shared memory to improve memory throughput (if applicable)
    extern __shared__ int64_t shared_mem[];

    // Calculate unique thread index across grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < num_elements) { 
        // Update to_normalize using cached values
        to_normalize[idx * 3] = cache_batch_index;
        to_normalize[idx * 3 + 1] = cache_class_index;
        to_normalize[idx * 3 + 2] = static_cast<int64_t>(original[idx]);
    }
}