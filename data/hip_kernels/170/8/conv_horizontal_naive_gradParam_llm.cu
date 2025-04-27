#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_horizontal_naive_gradParam(const int n, float *dw, const float *x, const float *dy, const int kL, const int oH, const int oW)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    int iW = oW + kL - 1;

    for (int i = idx; i < n; i += stride) {
        int dy_offset = (i / kL) * oH * oW;
        int x_offset = (i / kL) * oH * oW + i % kL;
        float sum = 0.0f;  // Initialize local sum for reduction

        for (int j = 0; j < oH; j++) {
            for (int k = 0; k < oW; k++) {
                sum += dy[dy_offset + j * oW + k] * x[x_offset + j * iW + k];
            }
        }
        dw[i] = sum;  // Store accumulated sum into global memory
    }
}