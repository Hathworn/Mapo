#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kExpandAndAdd(float* source, float* mat, float* indices, float* target, int width, int height, float mult, int width2) {
    // Calculate a unique thread index for the kernel
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Total number of threads in the grid
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Loop over the data with stride equal to the number of threads
    for (unsigned int i = idx; i < width * height; i += numThreads) {
        // Efficiently compute position in the matrix using precomputed value
        const int index_height = indices[i / height];
        const int pos = height * static_cast<int>(index_height) + i % height;

        // Perform the calculation avoiding division by zero
        if (pos < height * width2) {
            target[i] = source[i] + mult * mat[pos];
        } else {
            target[i] = nanf("");  // Use NaN as error value
        }
    }
}