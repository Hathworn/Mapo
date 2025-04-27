#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified the index calculation

    // Unroll the loop to process multiple elements per thread for improved performance
    int stride = blockDim.x * gridDim.x; 

    for (; i < n; i += stride) {
        error[i] = truth[i] ? -pred[i] : pred[i];
        delta[i] = (truth[i] > 0) ? 1 : -1;
    }
}