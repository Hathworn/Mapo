#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void conv_vertical_naive_gradParam(const int n, float *dw, const float *x, const float *dy, const int kL, const int oH, const int oW)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if thread index is out of bounds
    if (i >= n) return;

    int dy_offset = (i / kL) * oH * oW;
    int x_offset = (i / kL) * oH * oW + (i % kL) * oW;

    // Temporary accumulation variable
    float accum = 0.0f;

    // Loop through and accumulate
    for (int k = 0; k < oH * oW; k++) {
        accum += dy[dy_offset + k] * x[x_offset + k];
    }

    // Write back to global memory
    dw[i] = accum;
}