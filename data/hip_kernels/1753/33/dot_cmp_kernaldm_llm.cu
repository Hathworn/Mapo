#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot_cmp_kernaldm(const float* __restrict__ data1, const float* __restrict__ data2, const float* __restrict__ dm, float* __restrict__ device_soln, const int size, const int num_threads, const int offset)
{
    float dot = 0.0f;
    float nnn = 0.0f;

    int idx = threadIdx.x + blockIdx.x * num_threads + offset;
    int stride = blockDim.x * gridDim.x; // Use the grid stride loop

    // Optimize access pattern to utilize shared memory or cache more efficiently
    for (int i = idx; i < size * size; i += stride) {
        int index = i % size + ((i / size) * size * size);
        if(dm[index] > 0.5){
            dot += data1[index] * data2[index];
            nnn += 1.0f;
        }
    }

    device_soln[idx] = dot / (nnn > 0.0f ? nnn : 1.0f); // Handle division by zero safely
}