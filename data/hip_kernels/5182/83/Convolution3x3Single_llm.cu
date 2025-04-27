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

    // Ensure the thread is within the output boundaries
    if(x < width && y < height)
    {
        float result = 0;

        // Unroll the loop to minimize loop overhead
        result += mulWithKernel(x - 1, y - 1, -1, -1, input, width, height);
        result += mulWithKernel(x - 1, y    , -1,  0, input, width, height);
        result += mulWithKernel(x - 1, y + 1, -1,  1, input, width, height);

        result += mulWithKernel(x, y - 1, 0, -1, input, width, height);
        result += mulWithKernel(x, y    , 0,  0, input, width, height);
        result += mulWithKernel(x, y + 1, 0,  1, input, width, height);

        result += mulWithKernel(x + 1, y - 1, 1, -1, input, width, height);
        result += mulWithKernel(x + 1, y    , 1,  0, input, width, height);
        result += mulWithKernel(x + 1, y + 1, 1,  1, input, width, height);

        output[y * width + x] = result;
    }
}