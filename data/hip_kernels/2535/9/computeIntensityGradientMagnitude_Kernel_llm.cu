#include "hip/hip_runtime.h"
#include "includes.h"

#define T_PER_BLOCK 16
#define MINF __int_as_float(0xff800000)

__global__ void computeIntensityGradientMagnitude_Kernel(float* d_output, const float* d_input, unsigned int width, unsigned int height)
{
    const unsigned int x = blockIdx.x*blockDim.x + threadIdx.x;
    const unsigned int y = blockIdx.y*blockDim.y + threadIdx.y;

    if (x < width && y < height)
    {
        d_output[y*width + x] = MINF;

        // Simplified bounds check
        if (x > 0 && x < width - 1 && y > 0 && y < height - 1)
        {
            float pos00 = d_input[(y - 1)*width + (x - 1)];
            float pos01 = d_input[y*width + (x - 1)];
            float pos02 = d_input[(y + 1)*width + (x - 1)];
            float pos10 = d_input[(y - 1)*width + x];
            float pos12 = d_input[(y + 1)*width + x];
            float pos20 = d_input[(y - 1)*width + (x + 1)];
            float pos21 = d_input[y*width + (x + 1)];
            float pos22 = d_input[(y + 1)*width + (x + 1)];

            // Early exit if any MINF is detected
            if (pos00 == MINF || pos01 == MINF || pos02 == MINF || pos10 == MINF ||
                pos12 == MINF || pos20 == MINF || pos21 == MINF || pos22 == MINF)
                return;

            // Calculate gradients
            float resU = pos20 - pos00 + 2.0f * (pos21 - pos01) + pos22 - pos02;
            float resV = pos02 - pos00 + 2.0f * (pos12 - pos10) + pos22 - pos20;

            // Write result
            d_output[y*width + x] = sqrt(resU * resU + resV * resV);
        }
    }
}