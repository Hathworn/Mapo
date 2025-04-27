#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void relu_ker(float* src, float* dst, int N) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) {
        // Use fmaxf to apply ReLU in a compact form
        dst[i] = fmaxf(0.0f, src[i]);
    }
}