#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatMulKernel(float *Md, float *Nd, float *Pd, int width)
{
    // Calculate thread row and column within matrix
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to prevent out-of-bounds memory access
    if (row < width && col < width) {
        // Each thread computes one element of P
        float Pvalue = 0;

        // Multiply M and N using a loop with direct accesses
        for (int k = 0; k < width; ++k) {
            float Melement = Md[row * width + k];
            float Nelement = Nd[k * width + col];
            Pvalue += Melement * Nelement;
        }

        // Write Pvalue to device memory after computation
        Pd[row * width + col] = Pvalue;
    }
}