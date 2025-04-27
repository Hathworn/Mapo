#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop over input elements to handle more data than threads
    for (; i < n; i += stride) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff); // Use fast math function

        if(abs_val < 1.0f) {
            error[i] = diff * diff; // Square of the difference for small error
            delta[i] = diff; // Store the difference
        } else {
            error[i] = 2.0f * abs_val - 1.0f; // Adjusted error for large differences
            delta[i] = copysignf(1.0f, diff); // Efficient sign determination
        }
    }
}