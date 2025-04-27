#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_CUDA_THREADS_PER_BLOCK 1024

__global__ void Max_Interleaved_Addressing_Global(float* data, int data_size) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimized: Use shared memory for block-level reduction
    extern __shared__ float shared_data[];

    if (idx < data_size) {
        shared_data[threadIdx.x] = data[idx];
    } else {
        shared_data[threadIdx.x] = -INFINITY; // Ensure there's no effect on max
    }
    __syncthreads();

    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        int index = 2 * stride * threadIdx.x;
        if (index + stride < blockDim.x) {
            shared_data[index] = max(shared_data[index], shared_data[index + stride]);
        }
        __syncthreads();
    }

    // Write the block's result back to global memory
    if (threadIdx.x == 0) {
        data[blockIdx.x] = shared_data[0];
    }
}