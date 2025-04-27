#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error) {
    // Optimized index calculation for better readability
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure all threads are within bounds
    if (i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);

        // Optimize conditional statements using ternary operator
        error[i] = (abs_val < 1) ? (diff * diff) : (2 * abs_val - 1);
        delta[i] = (abs_val < 1) ? diff : ((diff > 0) ? 1 : -1);
    }
}