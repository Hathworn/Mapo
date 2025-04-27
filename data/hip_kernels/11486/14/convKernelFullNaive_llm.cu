#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convKernelFullNaive(float* d_Input, float* d_Output, float* d_Kernel, int imageW, int imageH, int kernelR)
{
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;

    int loc = row * imageW + col;

    float s = 0;
    
    // Cache kernel radius multiplication factor
    int kernelSize = kernelR * 2 + 1;

    for (int i = -kernelR; i <= kernelR; i++) {
        for (int j = -kernelR; j <= kernelR; j++) {
            int newRow = row + i;
            int newCol = col + j;

            // Check bounds and perform computation
            if (newRow >= 0 && newRow < imageH && newCol >= 0 && newCol < imageW) {
                int inputIdx = newRow * imageW + newCol;
                int kernelIdx = (kernelR - i) * kernelSize + (kernelR - j);
                s += d_Input[inputIdx] * d_Kernel[kernelIdx];
            }
        }
    }
    d_Output[loc] = s;
}