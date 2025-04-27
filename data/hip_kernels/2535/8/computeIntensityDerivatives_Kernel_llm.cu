#include "hip/hip_runtime.h"
#include "includes.h"

#define T_PER_BLOCK 16
#define MINF __int_as_float(0xff800000)

__global__ void computeIntensityDerivatives_Kernel(float2* d_output, const float* d_input, unsigned int width, unsigned int height)
{
    const unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height)
    {
        d_output[y * width + x] = make_float2(MINF, MINF);

        // Check boundaries to avoid shared memory usage
        if (x > 0 && x < width - 1 && y > 0 && y < height - 1)
        {
            float pos00 = d_input[(y - 1) * width + (x - 1)];
            float pos01 = d_input[y * width + (x - 1)];
            float pos02 = d_input[(y + 1) * width + (x - 1)];
            float pos10 = d_input[(y - 1) * width + x];
            float pos12 = d_input[(y + 1) * width + x];
            float pos20 = d_input[(y - 1) * width + (x + 1)];
            float pos21 = d_input[y * width + (x + 1)];
            float pos22 = d_input[(y + 1) * width + (x + 1)];

            // Early exit if any input is MINF
            if (pos00 != MINF && pos01 != MINF && pos02 != MINF &&
                pos10 != MINF && pos12 != MINF &&
                pos20 != MINF && pos21 != MINF && pos22 != MINF) 
            {
                float resU = (-1.0f) * pos00 + (1.0f) * pos20 +
                             (-2.0f) * pos01 + (2.0f) * pos21 +
                             (-1.0f) * pos02 + (1.0f) * pos22;
                resU /= 8.0f;

                float resV = (-1.0f) * pos00 + (-2.0f) * pos10 + (-1.0f) * pos20 +
                             (1.0f) * pos02 + (2.0f) * pos12 + (1.0f) * pos22;
                resV /= 8.0f;

                d_output[y * width + x] = make_float2(resU, resV);
            }
        }
    }
}