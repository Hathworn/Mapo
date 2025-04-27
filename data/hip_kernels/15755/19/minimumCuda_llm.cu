#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void minimumCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height) 
{
    // Calculate the global x and y position using block and thread indices
    const uint32_t index = blockIdx.y * blockDim.y * width + blockIdx.x * blockDim.x + threadIdx.y * width + threadIdx.x;

    // Check bounds for single flat index
    if (index < width * height) {
        // Pointers for input and output data based on calculated index
        const uint8_t *in1X = in1 + index;
        const uint8_t *in2X = in2 + index;
        uint8_t *outX = out + index;

        // Compare and assign minimum value using ternary operator
        *outX = (*in1X < *in2X) ? *in1X : *in2X;
    }
}