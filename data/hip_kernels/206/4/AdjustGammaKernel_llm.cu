```c
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
__global__ void AdjustGammaKernel(float *imgOut, float *imgIn, int width, int height, float gamma, float minVal, float maxVal)
{
    __shared__ float bufData[BLOCK_SIZE];

    // Get the index of pixel
    const int index = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    
    // Check that it's not out of bounds
    if (index < (height * width)) {
        // Load data to shared variable
        bufData[threadIdx.x] = imgIn[index];

        // Find the according multiplier
        float tempLevel = (bufData[threadIdx.x] - minVal) / maxVal;

        // Apply gamma correction
        tempLevel = powf(tempLevel, 1.0f / gamma);

        // Check that it's within required range and clamp
        tempLevel = fminf(fmaxf(tempLevel, 0.0f), 1.0f);

        // Write data back
        imgOut[index] = tempLevel;
    }
}