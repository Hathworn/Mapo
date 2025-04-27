#include "hip/hip_runtime.h"
#include "includes.h"

#define T_PER_BLOCK 16
#define MINF __int_as_float(0xff800000)

__global__ void resampleFloat_Kernel(float* d_output, unsigned int outputWidth, unsigned int outputHeight, const float* d_input, unsigned int inputWidth, unsigned int inputHeight) 
{
    const unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Pre-calculate scales outside if to avoid redundant calculation
    const float scaleWidth = (float)(inputWidth - 1) / (float)(outputWidth - 1);
    const float scaleHeight = (float)(inputHeight - 1) / (float)(outputHeight - 1);

    if (x < outputWidth && y < outputHeight) 
    {
        // Use efficient intrinsic to reduce type conversion
        const unsigned int xInput = __float2uint_rn(x * scaleWidth);
        const unsigned int yInput = __float2uint_rn(y * scaleHeight);

        if (xInput < inputWidth && yInput < inputHeight) 
        {
            // Use shared memory or register to minimize global memory access bottleneck (optional)
            d_output[y * outputWidth + x] = d_input[yInput * inputWidth + xInput];
            // d_output[y*outputWidth + x] = bilinearInterpolationFloat(x*scaleWidth, y*scaleHeight, d_input, inputWidth, inputHeight);
        }
    }
}