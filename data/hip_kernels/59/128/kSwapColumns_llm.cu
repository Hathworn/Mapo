#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSwapColumns(float* source, float* target, float* indices1, float* indices2, int cols, int width, int height) {
    __shared__ float sharedSource[BLOCK_SIZE]; // Use shared memory for faster access
    __shared__ float sharedTarget[BLOCK_SIZE]; // Use shared memory for faster access

    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;
    unsigned int column, row, source_pos, target_pos;

    for (unsigned int i = idx; i < height * cols; i += numThreads) {
        column = i / height;
        row = i % height;
        source_pos = height * (int)indices1[column] + row;
        target_pos = height * (int)indices2[column] + row;

        // Load elements into shared memory
        sharedSource[threadIdx.x] = source[source_pos];
        sharedTarget[threadIdx.x] = target[target_pos];
        
        __syncthreads(); // Ensure all threads have loaded their elements

        source[source_pos] = sharedTarget[threadIdx.x];
        target[target_pos] = sharedSource[threadIdx.x];
        
        __syncthreads(); // Ensure all swaps are complete before next iteration
    }
}