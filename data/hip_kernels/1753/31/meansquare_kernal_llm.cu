#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void meansquare_kernal(const float * data, float * device_stats, const int size, const int num_calcs, const int num_threads, const int offset)
{
    float meansq = 0.0f;
    const uint x = threadIdx.x;
    const uint y = blockIdx.x;
    int idx = x + y * num_threads + offset;

    // Use shared memory for partial reduction to improve memory access efficiency
    extern __shared__ float shared_data[];
    shared_data[threadIdx.x] = 0.0f;

    for(int i = 0; i < size; i++){
        int index = i * size + idx % size + ((idx / size) * size * size);
        shared_data[threadIdx.x] += data[index] * data[index];
    }

    __syncthreads(); // Ensure all threads have written to shared memory

    // Perform block-wise reduction to compute the mean square
    if (threadIdx.x == 0) {
        for (int i = 1; i < blockDim.x; i++) {
            shared_data[0] += shared_data[i];
        }
        device_stats[idx] = shared_data[0] / size;
    }
}