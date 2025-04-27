#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (i < n) {
        // Precompute reuseable value
        float t = truth[i];
        error[i] = t ? -pred[i] : pred[i];
        delta[i] = (t > 0) ? 1.0f : -1.0f;
    }
}