#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified 1D index calculation for efficiency
    if (i < n) {
        float t = truth[i];
        float p = pred[i];
        float log_p = (p > 0) ? log(p) : 0; // Avoid log(0) by checking positivity
        error[i] = (t != 0) ? -log_p : 0; // Only compute log if t is non-zero
        delta[i] = t - p; // Compute the gradient
    }
}