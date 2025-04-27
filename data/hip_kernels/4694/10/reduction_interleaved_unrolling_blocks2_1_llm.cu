#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduction_interleaved_unrolling_blocks2_1(int * input, int * temp, int size)
{
    extern __shared__ int s_data[];  // Use shared memory to optimize memory access
    int tid = threadIdx.x;
    
    // Start index for this thread
    int index = blockDim.x * blockIdx.x * 2 + threadIdx.x;
    
    // Load elements into shared memory
    if (index < size) {
        s_data[tid] = input[index];
        if (index + blockDim.x < size) {
            s_data[tid] += input[index + blockDim.x];
        }
    } else {
        s_data[tid] = 0;
    }
    
    __syncthreads();

    // Unroll and reduce within shared memory
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (tid < offset) {
            s_data[tid] += s_data[tid + offset];
        }
        __syncthreads();
    }
    
    // Store result from block to global memory
    if (tid == 0) {
        temp[blockIdx.x] = s_data[0];
    }
}