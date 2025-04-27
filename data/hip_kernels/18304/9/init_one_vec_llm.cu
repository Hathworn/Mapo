#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_one_vec(float *d_one_vec, size_t length) {
    // Calculate the global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread is within bounds
    if (i < length) {
        // Set the value to 1.0f
        d_one_vec[i] = 1.0f;
    }
}