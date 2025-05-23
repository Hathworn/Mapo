#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 512
#define BLOCK_SIZE_HOUGH 360
#define STEP_SIZE 5
#define NUMBER_OF_STEPS 360/STEP_SIZE

// Circ mask kernel storage
__constant__ int maskKernelX[NUMBER_OF_STEPS];
__constant__ int maskKernelY[NUMBER_OF_STEPS];

// Function to set precalculated relative coordinates for circle boundary coordinates
__global__ void setAllValuesKernel(int* houghSpace, int height, int width, float value)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (index < height * width) {
        houghSpace[index] = value;
    }
    
    // __syncthreads() is unnecessary here, as threads don't depend on each other
}