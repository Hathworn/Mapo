#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the index for the current thread directly
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread operates within bounds
    if(i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);

        // Use a ternary operator for concise conditional logic
        error[i] = abs_val < 1 ? diff * diff : 2 * abs_val - 1;
        delta[i] = abs_val < 1 ? diff : (diff > 0 ? 1 : -1);
    }
}