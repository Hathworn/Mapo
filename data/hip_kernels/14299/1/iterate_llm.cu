#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void iterate(float* originalMatrixD, float* solutionD, int originalMatrixWidth, int startingIndex) {
    // Use linear shared memory array for simplicity
    __shared__ float originalMatrixDS[TILE_WIDTH * TILE_WIDTH];

    int tx = threadIdx.x;
    int ty = threadIdx.y;
    int blockId = blockIdx.x + blockIdx.y * gridDim.x;
    int currentMatrixIndex = blockId * (blockDim.x * blockDim.y) + (ty * blockDim.x) + tx + startingIndex;

    // Load data into shared memory
    originalMatrixDS[ty * TILE_WIDTH + tx] = originalMatrixD[currentMatrixIndex];

    // Ensure all threads are synchronized after loading shared memory
    __syncthreads();

    // Determine if on edge
    bool onEdge = (currentMatrixIndex % originalMatrixWidth == 0) || 
                  (currentMatrixIndex % originalMatrixWidth == originalMatrixWidth - 1) ||
                  (currentMatrixIndex < originalMatrixWidth) || 
                  (currentMatrixIndex >= (originalMatrixWidth * (originalMatrixWidth - 1)));

    float replaceAmount;
    if (onEdge) {
        // Keep original value on edges
        replaceAmount = originalMatrixDS[ty * TILE_WIDTH + tx];
    } else {
        // Efficiently calculate neighbors' indices
        int idxLeft = (tx > 0) ? tx - 1 : -1;
        int idxRight = (tx < TILE_WIDTH - 1) ? tx + 1 : -1;
        float top = originalMatrixD[currentMatrixIndex - originalMatrixWidth];
        float bottom = originalMatrixD[currentMatrixIndex + originalMatrixWidth];
        
        float left = (idxLeft != -1) ? originalMatrixDS[ty * TILE_WIDTH + idxLeft] : originalMatrixD[currentMatrixIndex - 1];
        float right = (idxRight != -1) ? originalMatrixDS[ty * TILE_WIDTH + idxRight] : originalMatrixD[currentMatrixIndex + 1];

        // Calculate new value based on neighbors
        replaceAmount = (left + right + top + bottom) / 4;
    }

    // Store calculated value in solution matrix
    solutionD[currentMatrixIndex] = replaceAmount;
}