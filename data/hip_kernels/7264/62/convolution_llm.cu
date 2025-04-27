#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convolution(float* input, int inputRows, int inputCols, int inputLd, float* kernel, int kernelRows, int kernelCols, int kernelLd, int rowStep, int colStep, float* output, int outputLd) {

    int row = (blockIdx.y * blockDim.y + threadIdx.y) * rowStep;
    int col = (blockIdx.x * blockDim.x + threadIdx.x) * colStep;

    // Ensuring threads only compute valid output elements
    if (row <= inputRows - kernelRows && col <= inputCols - kernelCols) {
        float sum = 0.0f; // Initialize sum for this output element
        for (int i = 0; i < kernelRows; i++) {
            for (int j = 0; j < kernelCols; j++) {
                // Accumulate product of kernel and corresponding input
                sum += kernel[i + j * kernelLd] * input[(row + i) + (col + j) * inputLd];
            }
        }
        output[row + col * outputLd] = sum; // Store accumulated sum in output
    }
}