#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatrixMulKernel (float* Md, float* Nd, float* Pd, int ncols) {
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if (row < ncols && col < ncols) { // Ensure threads do not access out of bounds memory
        float Pvalue = 0.0f;
        for (int k = 0; k < ncols; ++k) {
            float Melement = Md[row * ncols + k];
            float Nelement = Nd[k * ncols + col];
            Pvalue += Melement * Nelement;
        }
        Pd[row * ncols + col] = Pvalue;
    }
}