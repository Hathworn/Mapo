#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_horizontal_naive_output(const int n, float *y, const float *x, const float *w, const int iH, const int iW, const int kL)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index doesn't exceed limit
    if (i < n) {
        int oW = iW - kL + 1;
        int x_offset = (i / oW) * iW + i % oW;
        int w_offset = (i / (oW * iH)) * kL;
        float sum = 0.0f;

        // Iterate over convolution kernel length and accumulate results
        for (int k = 0; k < kL; k++) {
            sum += w[w_offset + k] * x[x_offset + k];
        }

        // Storing sum result into output array
        y[i] = sum;
    }
}