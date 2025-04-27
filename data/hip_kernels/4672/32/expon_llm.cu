#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expon(float* env, int nhalf) {
    // Optimize by using a grid stride loop to ensure all elements are processed
    for (int i = threadIdx.x + blockDim.x * blockIdx.x; i < nhalf; i += blockDim.x * gridDim.x) {
        env[i] = exp(env[i] / nhalf); // Exponentiate
    }
}