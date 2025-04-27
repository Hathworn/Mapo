#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _norm_backward_kernel(float *x, float *mean, float *var, float *mean_diff, float *var_diff, int b, int c, int wxh, float *grad) {
    int ind = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    int stride = blockDim.x * gridDim.x; // Calculate stride for loop
    int total = b * c * wxh;
  
    for (; ind < total; ind += stride) { // Use loop for processing elements
        int j = (ind / wxh) % c;
        float inv_sqrt_var = 1.0f / sqrtf(var[j] + 0.00001f); // Avoid recalculating
        grad[ind] = grad[ind] * inv_sqrt_var +
                    var_diff[j] * 2.0f * (x[ind] - mean[j]) / (wxh * b) +
                    mean_diff[j] / (wxh * b);
    }
}