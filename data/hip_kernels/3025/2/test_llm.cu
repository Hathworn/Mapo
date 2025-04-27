#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void test(int* input, int* output) {
    // Calculate global thread index within grid
    int tx = threadIdx.x + blockIdx.x * blockDim.x;
    int ty = threadIdx.y + blockIdx.y * blockDim.y;
    int index = tx + ty * gridDim.x * blockDim.x;  // Enhance memory coalescing
    output[index] = input[index] * 2;
}