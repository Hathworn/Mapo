#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kShuffleColumns(float* source, float* target, float* indices, int width, int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Utilize loop unrolling to reduce loop overhead
    for (unsigned int i = idx; i < height * ((width + 1) / 2); i += numThreads) {
        unsigned int column = 2 * (i / height);
        unsigned int row = i % height;
        unsigned int pos1, pos2;
        
        pos1 = height * static_cast<int>(indices[column]) + row;
        
        if (column + 1 < width) {
            pos2 = height * static_cast<int>(indices[column + 1]) + row;
            float temp1 = source[pos1];
            float temp2 = source[pos2];
            target[pos2] = temp1;
            target[pos1] = temp2;
        } else {
            target[pos1] = source[pos1];
        }
    }
}