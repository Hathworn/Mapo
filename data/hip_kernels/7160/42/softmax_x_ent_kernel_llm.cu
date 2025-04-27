#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified calculation of 'i' for 1D grid/block.
    if(i < n) {
        float t = truth[i];
        float p = pred[i];
        float log_p = (t && p > 0) ? -log(p) : 0; // Prevents log(0) which is undefined.
        error[i] = log_p;
        delta[i] = t - p;
    }
}