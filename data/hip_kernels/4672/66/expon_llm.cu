#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expon(float* env, int nhalf) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use loop unrolling for improved performance
    for (; i < nhalf; i += stride) {
        env[i] = expf(env[i] / nhalf); // Use expf for single precision
    }
}