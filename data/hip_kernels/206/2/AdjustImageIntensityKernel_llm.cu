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
__global__ void AdjustImageIntensityKernel(float *imgOut, float *imgIn, int width, int height, float lowin, float lowout, float scale)
{
    __shared__ float bufData[BLOCK_SIZE];

    // Get the index of pixel
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check that it's not out of bounds before loading
    if (index < width * height) {
        // Load data to shared variable
        bufData[threadIdx.x] = imgIn[index];

        // Compute adjusted intensity level
        float tempLevel = (bufData[threadIdx.x] - lowin) * scale + lowout;

        // Use local variable for boundary conditions
        float result;
        if (tempLevel < 0) {
            result = 0;
        } else if (tempLevel > 1) {
            result = 1;
        } else {
            result = tempLevel;
        }

        // Write data back
        imgOut[index] = result;
    }
}