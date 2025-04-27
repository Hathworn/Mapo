#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BilinearResampleKernel(float *input, float *output, int inputWidth, int inputHeight, int outputWidth, int outputHeight)
{
    int size = outputWidth * outputHeight;
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x; // Optimize thread id calculation

    if (id < size) {
        int px = id % outputWidth;
        int py = id / outputWidth;

        float xRatio = (float)(inputWidth - 1) / (outputWidth - 1);
        float yRatio = (float)(inputHeight - 1) / (outputHeight - 1);

        float x = xRatio * px;
        float y = yRatio * py;

        int xL = (int)x; // Use (int) directly for floor
        int xR = min(xL + 1, inputWidth - 1); // Use min to prevent array bounds exceed
        int yT = (int)y; // Use (int) directly for floor
        int yB = min(yT + 1, inputHeight - 1); // Use min to prevent array bounds exceed
        
        float dL = xR - x; // Simplify distance calculations
        float dR = 1.0f - dL;
        float dT = yB - y;
        float dB = 1.0f - dT;

        float topLeft = input[yT * inputWidth + xL];
        float topRight = input[yT * inputWidth + xR];
        float bottomLeft = input[yB * inputWidth + xL];
        float bottomRight = input[yB * inputWidth + xR];

        float iT = (xL == xR) ? topLeft : topLeft * dL + topRight * dR; // Use ternary operator for conditional assignment
        float iB = (xL == xR) ? bottomLeft : bottomLeft * dL + bottomRight * dR;

        output[py * outputWidth + px] = (yT == yB) ? iT : iT * dT + iB * dB; // Use ternary operator for conditional assignment
    }
}