#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void expon(float* env, int nhalf) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Loop unrolling
    int stride = blockDim.x * gridDim.x;
    for (int idx = i; idx < nhalf; idx += stride) {
        env[idx] = __expf(env[idx] / nhalf); // Use fast math
    }
}