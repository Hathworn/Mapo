#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_cmp_kernal(const float* data1, const float* data2, float* device_soln, const int size, const int num_threads, const int offset)
{
    extern __shared__ float shared_data[]; // Use shared memory for partial sums
    float dot = 0.0f;

    int idx = threadIdx.x + blockIdx.x * num_threads + offset;

    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        int index = i * size + idx % size + ((idx / size) * size * size); // Improved memory access pattern for better coalescing
        dot += data1[index] * data2[index];
    }

    shared_data[threadIdx.x] = dot; // Store result in shared memory
    __syncthreads(); // Synchronize threads within block

    // Reduce partial sums within the block
    if (threadIdx.x == 0) {
        float block_dot = 0.0f;
        for (int i = 0; i < blockDim.x; i++) {
            block_dot += shared_data[i];
        }
        device_soln[blockIdx.x] = block_dot / size;
    }
}