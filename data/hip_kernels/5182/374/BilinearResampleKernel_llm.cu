#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void BilinearResampleKernel(float *input, float *output, int inputWidth, int inputHeight, int outputWidth, int outputHeight)
{
    // Calculate global thread id
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int size = outputWidth * outputHeight;

    if (id < size)
    {
        // Calculate output pixel coordinates
        int px = id % outputWidth;
        int py = id / outputWidth;

        // Precompute ratios
        float xRatio = (float)(inputWidth - 1) / (outputWidth - 1);
        float yRatio = (float)(inputHeight - 1) / (outputHeight - 1);

        // Calculate float coordinates in input
        float x = xRatio * px;
        float y = yRatio * py;

        // Calculate floor and ceil integer indices directly
        int xL = (int)x;
        int xR = min(xL + 1, inputWidth - 1);
        int yT = (int)y;
        int yB = min(yT + 1, inputHeight - 1);

        // Precompute interpolation weights
        float dL = xR - x;
        float dR = x - xL;
        float dT = yB - y;
        float dB = y - yT;

        // Fetch corner pixel values
        float topLeft = input[yT * inputWidth + xL];
        float topRight = input[yT * inputWidth + xR];
        float bottomLeft = input[yB * inputWidth + xL];
        float bottomRight = input[yB * inputWidth + xR];

        // Compute interpolation in x direction
        float iT = topLeft * dL + topRight * dR;
        float iB = bottomLeft * dL + bottomRight * dR;

        // Interpolate in y direction and store the result
        output[py * outputWidth + px] = iT * dT + iB * dB;
    }
}