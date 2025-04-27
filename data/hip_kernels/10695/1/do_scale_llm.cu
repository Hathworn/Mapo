#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void do_scale(uint8_t * inBuffer, uint8_t * outBuffer, uint32_t inWidth, uint32_t inHeight, uint32_t outWidth, uint32_t outHeight, double ratioHeight, double ratioWidth, double xRatio, double yRatio, uint32_t outHeightOffset, uint32_t outWidthOffset, uint32_t inStep, uint32_t outStep)
{
    // Calculate output indices based on block and thread indices
    uint32_t outRowIndex = blockIdx.x + outHeightOffset;
    uint32_t outColIndex = threadIdx.x + outWidthOffset;
    uint32_t outIndex = (outRowIndex) * outWidth + outColIndex;

    // Calculate input indices for interpolation
    uint32_t inX00row = min(static_cast<uint32_t>(outRowIndex / ratioHeight), inHeight - 2); // Ensure within bounds
    uint32_t inX00col = min(static_cast<uint32_t>(outColIndex / ratioWidth), inWidth - 2);  // Ensure within bounds

    // Load input buffer values for bilinear interpolation
    uint8_t inX00 = inBuffer[(inX00row * inWidth + inX00col) * inStep];
    uint8_t inX01 = inBuffer[(inX00row * inWidth + inX00col + 1) * inStep];
    uint8_t inX10 = inBuffer[((inX00row + 1) * inWidth + inX00col) * inStep];
    uint8_t inX11 = inBuffer[((inX00row + 1) * inWidth + inX00col + 1) * inStep];

    // Perform bilinear interpolation and store result in output buffer
    outBuffer[outIndex * outStep] = static_cast<uint8_t>(
        yRatio * (xRatio * inX00 + (1 - xRatio) * inX01) +
        (1 - yRatio) * (xRatio * inX10 + (1 - xRatio) * inX11)
    );
}