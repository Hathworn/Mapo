#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _mean_variance_backward_kernel(float *x, float *grad, float *mean, float *var, int b, int c, int wxh, float *mean_diff, float *var_diff)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread index is within valid range
    if (i >= c) return;

    // Use shared memory for efficient accumulation
    __shared__ float shared_mean_diff;
    __shared__ float shared_var_diff;
    if (threadIdx.x == 0) {
        shared_mean_diff = 0.0f;
        shared_var_diff = 0.0f;
    }
    __syncthreads();

    // Perform accumulation
    for (int j = 0; j < b; ++j) {
        for (int k = 0; k < wxh; ++k) {
            int ind = j * c * wxh + i * wxh + k;
            atomicAdd(&shared_mean_diff, grad[ind]); // Use atomicAdd for safe accumulation
            atomicAdd(&shared_var_diff, grad[ind] * (x[ind] - mean[i]));
        }
    }
    __syncthreads();

    // Compute final results
    if (threadIdx.x == 0) {
        mean_diff[i] = shared_mean_diff * (-1.0f / sqrt(var[i] + 0.00001f)); // Use thread 0 to write result
        var_diff[i] = shared_var_diff * -0.5f / (var[i] * sqrtf(var[i]) + 0.00001f);
    }
}