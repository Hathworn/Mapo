#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);

        // Use ternary operator to simplify conditional assignment
        error[i] = (abs_val < 1) ? diff * diff : 2 * abs_val - 1;
        delta[i] = (abs_val < 1) ? diff : (diff > 0) ? 1 : -1;
    }
}