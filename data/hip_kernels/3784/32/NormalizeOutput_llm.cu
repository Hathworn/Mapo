#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Use shared memory for better memory access pattern and reduce latency
    extern __shared__ int64_t shared_mem[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Each thread loads elements into shared memory
    for (int i = idx; i < num_elements; i += stride) {
        shared_mem[threadIdx.x * 3] = batch_index;
        shared_mem[threadIdx.x * 3 + 1] = class_index;
        shared_mem[threadIdx.x * 3 + 2] = static_cast<int64_t>(original[i]);
        
        // Write shared memory back to global memory
        to_normalize[i * 3] = shared_mem[threadIdx.x * 3];
        to_normalize[i * 3 + 1] = shared_mem[threadIdx.x * 3 + 1];
        to_normalize[i * 3 + 2] = shared_mem[threadIdx.x * 3 + 2];
    }
}