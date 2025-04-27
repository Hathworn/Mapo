#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure we don't process out-of-bounds elements
    if(i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff); // Use fast math function
        if(abs_val < 1.0f) {
            error[i] = diff * diff;
            delta[i] = diff;
        }
        else {
            error[i] = abs_val * 2.0f - 1.0f;
            delta[i] = (diff < 0.0f) ? -1.0f : 1.0f;
        }
    }
}