#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Use shared memory to reduce global memory access latency
    __shared__ int64_t shared_data[256]; // Assuming blockDim.x <= 256 
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (idx < num_elements) {
        shared_data[threadIdx.x * 3] = batch_index;
        shared_data[threadIdx.x * 3 + 1] = class_index;
        shared_data[threadIdx.x * 3 + 2] = static_cast<int64_t>(original[idx]);
        
        // Write back to global memory with coalesced access
        to_normalize[idx * 3] = shared_data[threadIdx.x * 3];
        to_normalize[idx * 3 + 1] = shared_data[threadIdx.x * 3 + 1];
        to_normalize[idx * 3 + 2] = shared_data[threadIdx.x * 3 + 2];
    }
}