#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addScalarInArrayInPlace(float* in, float* add, float scale, int size) {
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to ensure all blocks/threads process the entire array
    int stride = blockDim.x * gridDim.x;

    // Loop through array with strides, no need to check 'tid < size' inside loop
    while (tid < size) {
        in[tid] += add[0] * scale;  // Direct scaling
        tid += stride;
    }
}