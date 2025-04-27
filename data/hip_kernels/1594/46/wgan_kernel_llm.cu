#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop over all elements with stride
    for (; i < n; i += stride) {
        // Compute error and delta
        error[i] = truth[i] ? -pred[i] : pred[i];
        delta[i] = (truth[i] > 0) ? 1.0f : -1.0f;
    }
}