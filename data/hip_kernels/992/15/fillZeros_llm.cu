#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fillZeros(float* buf, int size) {
    // Calculate the unique thread index using improved readability
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use the stride to cover all elements in a single loop
    for (int i = idx; i < size; i += stride) {
        buf[i] = 0.0f; // Assign zero directly
    }
}