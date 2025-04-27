#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid
    if(i < n) {
        float pred_i = pred[i]; // Cache pred[i] for reuse
        float truth_val = truth[i]; // Cache truth[i] for reuse
        error[i] = truth_val ? -pred_i : pred_i; // Use cached values
        delta[i] = truth_val > 0 ? 1 : -1; // Use cached values
    }
}