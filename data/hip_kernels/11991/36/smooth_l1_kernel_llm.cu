#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread operates on valid data
    if (i >= n) return;

    // Compute difference and absolute value
    float diff = truth[i] - pred[i];
    float abs_val = abs(diff);

    // Conditionally compute error and delta based on diff
    if(abs_val < 1) {
        error[i] = diff * diff;
        delta[i] = diff;
    } else {
        error[i] = 2 * abs_val - 1;
        delta[i] = copysign(1.0f, diff); // Use copysign to efficiently assign -1 or 1
    }
}