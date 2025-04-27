#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void onBothBufferOperatorKernel(const int warpWidth, const int input0OffsetX, const int input0OffsetY, const int input0Width, const int input0Height, const uint32_t* input0Buffer, const int input1OffsetX, const int input1OffsetY, const int input1Width, const int input1Height, const uint32_t* input1Buffer, const int outputOffsetX, const int outputOffsetY, const int outputWidth, const int outputHeight, uint32_t* outputMask) {
    // Thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure within bounds of the output
    if (x >= outputWidth || y >= outputHeight) return;

    uint32_t v = 0;
    const int outputX = x + outputOffsetX;
    const int outputY = y + outputOffsetY;
    // Calculating input indices with modulo optimization for wrapping
    const int input0X = (outputX + warpWidth - input0OffsetX) % warpWidth;
    const int input0Y = outputY - input0OffsetY;
    const int input1X = (outputX + warpWidth - input1OffsetX) % warpWidth;
    const int input1Y = outputY - input1OffsetY;

    // Check bounds and perform operations efficiently
    if (input1X >= 0 && input1X < input1Width &&
        input1Y >= 0 && input1Y < input1Height &&
        input0X >= 0 && input0X < input0Width &&
        input0Y >= 0 && input0Y < input0Height) {
        v = (input0Buffer[input0Y * input0Width + input0X] > 0 && 
             input1Buffer[input1Y * input1Width + input1X] > 0) ? 1 : 0;
    }

    // Assign the computed value to the output mask
    outputMask[y * outputWidth + x] = v;
}