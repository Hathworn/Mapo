#include "hip/hip_runtime.h"
#include "includes.h"

#define T_PER_BLOCK 16
#define MINF __int_as_float(0xff800000)

__global__ void erodeDepthMapDevice(float* d_output, float* d_input, int structureSize, int width, int height, float dThresh, float fracReq)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= 0 && x < width && y >= 0 && y < height)
    {
        unsigned int count = 0;
        float oldDepth = d_input[y * width + x];

        // Unrolling and optimization for the kernel loop
        for (int i = -structureSize; i <= structureSize; i++)
        {
            for (int j = -structureSize; j <= structureSize; j++)
            {
                int nx = x + j; // Precompute x + j
                int ny = y + i; // Precompute y + i
                
                if (nx >= 0 && nx < width && ny >= 0 && ny < height) // Check bounds
                {
                    float depth = d_input[ny * width + nx];
                    if (depth == MINF || depth == 0.0f || fabs(depth - oldDepth) > dThresh)
                    {
                        count++;
                    }
                }
            }
        }

        unsigned int sum = (2 * structureSize + 1) * (2 * structureSize + 1);
        if ((float)count / (float)sum >= fracReq) {
            d_output[y * width + x] = MINF;
        }
        else {
            d_output[y * width + x] = oldDepth; // Use pre-read oldDepth
        }
    }
}