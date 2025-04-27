#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSwapColumns(float* __restrict__ source, float* __restrict__ target, float* __restrict__ indices1, float* __restrict__ indices2, int cols, int width, int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Use registers for temporary values
    unsigned int column, row, source_pos, target_pos;

    for (unsigned int i = idx; i < height * cols; i += numThreads) {
        column = i / height;
        row = i % height;

        // Calculate linear indices for source and target positions
        source_pos = __float2int_rd(height * indices1[column]) + row; // use __float2int_rd to convert float to int
        target_pos = __float2int_rd(height * indices2[column]) + row;

        // Perform the swap
        float temp = source[source_pos];
        source[source_pos] = target[target_pos];
        target[target_pos] = temp;
    }
}