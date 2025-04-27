#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _mean_variance_forward_kernel(float *x, int b, int c, int wxh, float *mean, float *var)
{
    float scale = 1.0f / (b * wxh);
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for threads with id >= c
    if (i >= c) return;

    // Initialize means and variances to zero
    float sum = 0.0f, sum_squares = 0.0f;
    
    // Compute mean and variance for each channel
    for (int j = 0; j < b; ++j) {
        for (int k = 0; k < wxh; ++k) {
            int ind = j * c * wxh + i * wxh + k;
            float val = x[ind];
            sum += val;
            sum_squares += val * val;
        }
    }

    // Normalize sum and sum of squares by scale
    mean[i] = sum * scale;
    var[i] = sum_squares * scale - mean[i] * mean[i];
}