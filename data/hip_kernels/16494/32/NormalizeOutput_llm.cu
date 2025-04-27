#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void NormalizeOutput(const int num_elements, const int* original, int64_t* to_normalize, int64_t batch_index, int64_t class_index) {
    // Optimize using shared memory for fewer global memory accesses
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    extern __shared__ int temp[];
    
    if (idx < num_elements) {
        int local_idx = threadIdx.x;
        temp[local_idx] = original[idx];
        __syncthreads(); // Ensure all threads have loaded the data

        to_normalize[idx * 3] = batch_index;
        to_normalize[idx * 3 + 1] = class_index;
        to_normalize[idx * 3 + 2] = static_cast<int64_t>(temp[local_idx]);
    }
}