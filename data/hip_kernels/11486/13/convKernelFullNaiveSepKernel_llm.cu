#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convKernelFullNaiveSepKernel(float* d_Input, float* d_Output, float* d_Kernel, int imageW, int imageH, int kernelR)
{
    // Compute row and column index
    int row = blockDim.y * blockIdx.y + threadIdx.y;
    int col = blockDim.x * blockIdx.x + threadIdx.x;

    // Compute global index location
    int loc = row * imageW + col;

    // Check if within image bounds
    if (row >= imageH || col >= imageW) return;

    float s = 0.0f;
    // Iterate over the kernel
    for (int i = -kernelR; i <= kernelR; i++) {
        for (int j = -kernelR; j <= kernelR; j++) {
            int currentRow = row + i;
            int currentCol = col + j;
            // Accumulate if indices within bounds
            if (currentRow >= 0 && currentRow < imageH && currentCol >= 0 && currentCol < imageW) {
                float inputVal = d_Input[currentRow * imageW + currentCol];
                s += inputVal * d_Kernel[kernelR - i] * d_Kernel[kernelR - j];
            }
        }
    }
    // Store the result in the output
    d_Output[loc] = s;
}