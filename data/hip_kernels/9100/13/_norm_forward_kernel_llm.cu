#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _norm_forward_kernel(float *x, float *mean, float *variance, int b, int c, int wxh) {
    // Calculate index using a more efficient approach
    int ind = blockIdx.x * blockDim.x + threadIdx.x;

    if (ind >= b * c * wxh) return;

    // Precompute j index based on ind
    int j = (ind / wxh) % c;

    // Use a local variable for intermediate calculation
    float sqrt_var_epsilon = sqrt(variance[j] + 0.000001f);

    // Perform normalization
    x[ind] = (x[ind] - mean[j]) / sqrt_var_epsilon;
}