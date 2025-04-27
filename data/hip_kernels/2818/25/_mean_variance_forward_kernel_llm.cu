#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _mean_variance_forward_kernel(float *x, int b, int c, int wxh, float *mean, float *var) {
    float scale = 1.0f / (b * wxh);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= c) return;
    
    float temp_mean = 0.0f;
    float temp_var = 0.0f;
    
    // Calculate the sum and sum of squares in parallel
    for (int j = 0; j < b; ++j) {
        for (int k = 0; k < wxh; ++k) {
            int ind = j * c * wxh + i * wxh + k;
            temp_mean += x[ind];
            temp_var += x[ind] * x[ind];
        }
    }
    
    // Compute mean and variance
    mean[i] = temp_mean * scale;
    var[i] = temp_var * scale - mean[i] * mean[i];
}