#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify index calculation
    if(i < n) {
        float t = truth[i];  // Load truth[i] once for efficiency
        error[i] = t ? -pred[i] : pred[i];  // Direct conditional assignment
        delta[i] = (t > 0) ? 1.0f : -1.0f;  // Use float values for delta
    }
}