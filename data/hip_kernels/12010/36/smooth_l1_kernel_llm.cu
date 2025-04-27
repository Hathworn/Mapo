#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride approach for thread block to cover all n elements
    for (; i < n; i += blockDim.x * gridDim.x) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);

        if(abs_val < 1.0f) {
            error[i] = diff * diff;
            delta[i] = diff;
        }
        else {
            error[i] = 2.0f * abs_val - 1.0f;
            delta[i] = (diff < 0.0f) ? -1.0f : 1.0f;
        }
    }
}