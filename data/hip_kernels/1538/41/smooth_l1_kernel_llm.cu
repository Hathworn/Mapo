#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Ensure thread index is within bounds
    if(i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);

        // Use ternary operator for conditional assignments
        error[i] = (abs_val < 1) ? (diff * diff) : (2 * abs_val - 1);
        delta[i] = (abs_val < 1) ? diff : ((diff > 0) ? 1.0f : -1.0f);
    }
}