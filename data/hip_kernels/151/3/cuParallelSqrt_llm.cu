#include "hip/hip_runtime.h"
#include "includes.h"

// If the code is used in Matlab, set MATLAB_CODE to 1. Otherwise, set MATLAB_CODE to 0.
#define MATLAB_CODE 0

// Constants used by the program
#define MAX_PITCH_VALUE_IN_BYTES       262144
#define MAX_TEXTURE_WIDTH_IN_BYTES     65536
#define MAX_TEXTURE_HEIGHT_IN_BYTES    32768
#define MAX_PART_OF_FREE_MEMORY_USED   0.9
#define BLOCK_DIM                      16

// Texture containing the reference points (if it is possible)
texture<float, 2, hipReadModeElementType> texA;

__global__ void cuParallelSqrt(float *dist, int width) {
    // Calculate global index
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (xIndex < width) {
        // Use the rsqrt function for a faster approximation of the square root
        dist[xIndex] = rsqrtf(dist[xIndex]) * dist[xIndex];
    }
}