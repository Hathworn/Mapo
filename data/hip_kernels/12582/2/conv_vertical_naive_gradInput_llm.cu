#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_vertical_naive_gradInput(const int n, float *dx, const float *dy, const float *w, const int oH, const int oW, const int kL)
{
    // Each thread calculates a unique index within the bounds of data size n
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    int gridSize = blockDim.x * gridDim.x;

    // Loop to accommodate large data sizes
    while (i < n) { 
        int iH = oH + kL - 1;
        int iC = i / (iH * oW);
        int row = (i % (iH * oW)) / oW;
        int dy_offset = iC * oH * oW + i % (iH * oW);
        int w_offset = iC * kL;

        int k_begin = max(0, row - oH + 1);
        int k_end = min(kL, row + 1);

        float result = 0.0f; // Accumulate results in a temporary variable
        for (int k = k_begin; k < k_end; k++) {
            result += w[w_offset + k] * dy[dy_offset - k * oW];
        }
        dx[i] = result; // Assign accumulated result to output

        i += gridSize; // Move to next index
    }
}