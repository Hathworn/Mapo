#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within array bounds
    if (i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff); // Use built-in fabsf for fast absolute value calculation

        // Use ternary operator for better branch prediction
        error[i] = (abs_val < 1) ? (diff * diff) : (2 * abs_val - 1);
        delta[i] = (abs_val < 1) ? diff : ((diff < 0) ? -1 : 1);
    }
}