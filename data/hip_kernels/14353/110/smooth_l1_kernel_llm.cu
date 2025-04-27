#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;  // Calculate stride for grid-stride loop

    // Use grid-stride loop for improved parallelism
    for (int idx = i; idx < n; idx += stride) {
        float diff = truth[idx] - pred[idx];
        float abs_val = fabsf(diff);  // Use faster floating-point absolute value function
        if (abs_val < 1.0f) {
            error[idx] = diff * diff;
            delta[idx] = diff;
        } else {
            error[idx] = 2.0f * abs_val - 1.0f;
            delta[idx] = (diff > 0.0f) ? 1.0f : -1.0f;
        }
    }
}