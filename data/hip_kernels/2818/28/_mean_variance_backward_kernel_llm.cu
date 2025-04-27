#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _mean_variance_backward_kernel(float *x, float *grad, float *mean, float *var, int b, int c, int wxh, float *mean_diff, float *var_diff) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified global index calculation

    if (i >= c) return;

    // Register allocation to reduce global memory access
    float mean_diff_local = 0.0f;
    float var_diff_local = 0.0f;

    for (int j = 0; j < b; ++j) {
        for (int k = 0; k < wxh; ++k) {
            int ind = j * c * wxh + i * wxh + k;
            mean_diff_local += grad[ind];
            var_diff_local += grad[ind] * (x[ind] - mean[i]);
        }
    }

    // Use local variables to reduce redundant calculations and improve precision
    float inv_sqrt_var = rsqrtf(var[i] + 1e-5f);
    mean_diff[i] = mean_diff_local * (-inv_sqrt_var);
    var_diff[i] = var_diff_local * -0.5f / (var[i] * var[i] * inv_sqrt_var + 1e-5f);
}