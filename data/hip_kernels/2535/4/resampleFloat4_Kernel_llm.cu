#include "hip/hip_runtime.h"
#include "includes.h"

#define T_PER_BLOCK 16
#define MINF __int_as_float(0xff800000)

__global__ void resampleFloat4_Kernel(float4* d_output, unsigned int outputWidth, unsigned int outputHeight, const float4* d_input, unsigned int inputWidth, unsigned int inputHeight)
{
    // Calculate unique thread indices
    const unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within output bounds
    if (x < outputWidth && y < outputHeight)
    {
        // Pre-compute scaling factors
        const float scaleWidth = __fdividef(inputWidth - 1, outputWidth - 1);
        const float scaleHeight = __fdividef(inputHeight - 1, outputHeight - 1);

        // Calculate input coordinates with rounding
        const unsigned int xInput = __float2uint_rd(x * scaleWidth);
        const unsigned int yInput = __float2uint_rd(y * scaleHeight);

        // Perform bounds check and assign output
        if (xInput < inputWidth && yInput < inputHeight) {
            d_output[y * outputWidth + x] = d_input[yInput * inputWidth + xInput];
        }
    }
}