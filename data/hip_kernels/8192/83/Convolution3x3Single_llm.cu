#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float mulWithKernel(int x, int y, int kx, int ky, float* input, int width, int height)
{
    int px = min(max(x, 0), width - 1);
    int py = min(max(y, 0), height - 1);
    
    return D_KERNEL[3 * (ky + 1) + kx + 1] * input[py * width + px];
}

__global__ void Convolution3x3Single(float* input, float* output, int width, int height)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the thread is within the bounds
    if (x < width && y < height)
    {
        float result = 0;

        // Unrolling the loops to reduce overhead
        #pragma unroll
        for (int dy = -1; dy <= 1; ++dy)
        {
            #pragma unroll
            for (int dx = -1; dx <= 1; ++dx)
            {
                result += mulWithKernel(x + dx, y + dy, dx, dy, input, width, height);
            }
        }

        output[y * width + x] = result;
    }
}