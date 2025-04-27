#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_vertical_naive_gradParam(const int n, float *dw, const float *x, const float *dy, const int kL, const int oH, const int oW)
{
    // Calculate the global index based on block and thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Iterate over grid-stride loop to cover all elements
    for (; i < n; i += blockDim.x * gridDim.x) {
        // Calculate offsets for x and dy arrays
        int dy_offset = (i / kL) * oH * oW;
        int x_offset = (i / kL) * oH * oW + (i % kL) * oW;

        // Use inner-loop unrolling to reduce loop overhead
        float sum = 0.0f;
        for (int k = 0; k < oH * oW; k++) {
            sum += dy[dy_offset + k] * x[x_offset + k];
        }
        dw[i] = sum;
    }
}