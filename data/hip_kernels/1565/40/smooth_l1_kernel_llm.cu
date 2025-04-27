#include "hip/hip_runtime.h"
#include "includes.h"

// Grid stride loop for improved memory coalescing and load balance
__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);
        if(abs_val < 1) {
            error[i] = diff * diff;
            delta[i] = diff;
        } else {
            error[i] = 2*abs_val - 1;
            delta[i] = (diff > 0) ? 1 : -1;
        }
    }
}