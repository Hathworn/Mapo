#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSwapColumns(float* source, float* target, float* indices1, float* indices2, int cols, int width, int height) {
    // Calculate flattened thread index for global memory access
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Pre-calculate variables outside of the loop for reusability
    float temp;
    unsigned int column, row, source_pos, target_pos;

    // Loop over matrix elements within the column
    for (unsigned int i = idx; i < height * cols; i += numThreads) {
        column = i / height;
        row = i % height;
        
        // Calculate source and target positions based on column indices
        source_pos = height * static_cast<int>(indices1[column]) + row;
        target_pos = height * static_cast<int>(indices2[column]) + row;

        // Perform the swap operation
        temp = source[source_pos];
        source[source_pos] = target[target_pos];
        target[target_pos] = temp;
    }
}