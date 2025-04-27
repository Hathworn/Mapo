#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function
__global__ void NormalizeOutput(const int num_elements, const int* __restrict__ original, int64_t* __restrict__ to_normalize, int64_t batch_index, int64_t class_index) {
    // Using shared memory to reduce global memory accesses
    extern __shared__ int64_t shared_memory[];

    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < num_elements) {
        shared_memory[threadIdx.x * 3] = batch_index;
        shared_memory[threadIdx.x * 3 + 1] = class_index;
        shared_memory[threadIdx.x * 3 + 2] = static_cast<int64_t>(original[idx]);
        
        // Synchronize to ensure all threads have written their data to shared memory
        __syncthreads();

        // Write data from shared memory back to global memory
        to_normalize[idx * 3] = shared_memory[threadIdx.x * 3];
        to_normalize[idx * 3 + 1] = shared_memory[threadIdx.x * 3 + 1];
        to_normalize[idx * 3 + 2] = shared_memory[threadIdx.x * 3 + 2];
    }
}