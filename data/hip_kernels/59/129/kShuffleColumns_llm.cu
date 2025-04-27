#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kShuffleColumns(float* source, float* target, float* indices, int width, int height) {
    // Calculate the unique thread index, total thread count
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Loop through each available column for this thread
    for (unsigned int i = idx; i < height * ((width + 1) / 2); i += numThreads) {
        unsigned int column = 2 * (i / height);
        unsigned int row = i % height;

        // Check if column exceeds width, avoid out-of-bound access
        if (column + 1 < width) {
            unsigned int pos1 = height * (int)indices[column] + row;
            unsigned int pos2 = height * (int)indices[column + 1] + row;

            // Swap the source contents and assign to target positions
            float temp1 = source[pos1];
            float temp2 = source[pos2];
            target[pos1] = temp2;
            target[pos2] = temp1;
        } else {
            unsigned int pos1 = height * (int)indices[column] + row;
            target[pos1] = source[pos1];
        }
    }
}