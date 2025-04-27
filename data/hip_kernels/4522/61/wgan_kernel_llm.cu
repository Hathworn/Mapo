#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    if (i < n) {
        float t = truth[i]; // Cache truth[i] for reuse
        error[i] = t ? -pred[i] : pred[i];
        delta[i] = (t > 0) ? 1 : -1;
    }
}