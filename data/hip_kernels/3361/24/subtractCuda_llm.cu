#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtractCuda(const uint8_t *in1, uint32_t rowSizeIn1, const uint8_t *in2, uint32_t rowSizeIn2, uint8_t *out, uint32_t rowSizeOut, uint32_t width, uint32_t height)
{
    // Calculate the 1D index for the pixel
    const uint32_t index = blockDim.x * blockIdx.x + threadIdx.x + 
                           (blockDim.y * blockIdx.y + threadIdx.y) * rowSizeOut;

    // Check if the index is in bounds
    if (index < width * height) {
        // Load input pixels
        const uint8_t in1Val = in1[index];
        const uint8_t in2Val = in2[index];

        // Perform subtraction and write the result
        out[index] = (in1Val > in2Val) ? (in1Val - in2Val) : 0;
    }
}