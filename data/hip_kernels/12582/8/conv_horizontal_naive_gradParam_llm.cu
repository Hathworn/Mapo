#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void conv_horizontal_naive_gradParam(const int n, float *dw, const float *x, const float *dy, const int kL, const int oH, const int oW)
{
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) { // Avoid out-of-bounds access
        int iW = oW + kL - 1;
        int dy_offset = (i / kL) * oH * oW;
        int x_offset = (i / kL) * oH * oW + i % kL;
        float temp_dw = 0.0f; // Use a temporary variable to reduce memory access

        for (int j = 0; j < oH; j++) {
            for (int k = 0; k < oW; k++) {
                temp_dw += dy[dy_offset + j * oW + k] * x[x_offset + j * iW + k];
            }
        }
        dw[i] = temp_dw; // Write back once per thread
    }
}