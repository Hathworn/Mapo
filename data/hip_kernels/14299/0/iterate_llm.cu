#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADSPBLK 1024
#define THREADSPSM 2048
#define TILE_WIDTH 32
#define TOTAL_ITERATIONS 50

int main_n;

__global__ void iterate(float* originalMatrixD, float* solutionD, int originalMatrixWidth, int startingIndex) {
    // Use linear indexing for shared memory to improve memory coalescing
    __shared__ float originalMatrixDS[TILE_WIDTH * TILE_WIDTH];

    int tx = threadIdx.x;
    int ty = threadIdx.y;

    int blockId = blockIdx.x + blockIdx.y * gridDim.x;

    int currentMatrixIndex = blockId * (blockDim.x * blockDim.y) +
                            (threadIdx.y * blockDim.x) + threadIdx.x;
    currentMatrixIndex += startingIndex;

    originalMatrixDS[ty * TILE_WIDTH + tx] = originalMatrixD[currentMatrixIndex];

    // Sync up w/ shared data set up
    __syncthreads();

    float replaceAmount;
    bool onEdge = false;
    int XEdgeCheckMod = currentMatrixIndex % originalMatrixWidth;

    // Check edges using condensed logic for better readability
    onEdge = (XEdgeCheckMod == 0 || XEdgeCheckMod == originalMatrixWidth - 1 || 
              currentMatrixIndex < originalMatrixWidth || 
              currentMatrixIndex >= (originalMatrixWidth * originalMatrixWidth - originalMatrixWidth));

    if (onEdge) {
        replaceAmount = originalMatrixDS[ty * TILE_WIDTH + tx];
    } else {
        // Use registers to store data read from global memory
        float top = originalMatrixD[currentMatrixIndex - originalMatrixWidth];
        float bottom = originalMatrixD[currentMatrixIndex + originalMatrixWidth];
        float left;
        float right;

        // Read boundaries conditionally to minimize branch divergence
        left = (tx == 0) ? originalMatrixD[currentMatrixIndex - 1] : originalMatrixDS[ty * TILE_WIDTH + tx - 1];
        right = (tx == TILE_WIDTH - 1) ? originalMatrixD[currentMatrixIndex + 1] : originalMatrixDS[ty * TILE_WIDTH + tx + 1];

        replaceAmount = (left + right + top + bottom) * 0.25f; // Use multiplication instead of division for efficiency
    }

    solutionD[currentMatrixIndex] = replaceAmount;
}