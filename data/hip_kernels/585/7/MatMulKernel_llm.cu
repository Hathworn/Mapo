```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MatMulKernel(float *Md, float *Nd, float *Pd, int width)
{
    // Global row and column index of the output matrix
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread is within matrix bounds
    if (row < width && col < width) {
        float Pvalue = 0;

        // Efficient coalesced accesses for matrix multiplication
        for (int k = 0; k < width; ++k) {
            float Melement = Md[row * width + k];
            float Nelement = Nd[k * width + col];
            Pvalue += Melement * Nelement;
        }

        // Write Pvalue to result matrix
        Pd[row * width + col] = Pvalue;
    }
}