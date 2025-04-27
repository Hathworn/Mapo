#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_one_vec(float *d_one_vec, size_t length) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop with stride to ensure all elements are set across multiple threads
    for (; i < length; i += blockDim.x * gridDim.x) {
        d_one_vec[i] = 1.f; // Initialize element to 1.0
    }
}