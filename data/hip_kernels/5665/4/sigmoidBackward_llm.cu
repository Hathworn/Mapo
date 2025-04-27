#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float sigmoid_derivate(float x) {
    return __fmul_rn(x, __fsub_rn(1.0f, x));
}

__device__ float sigmoid(float x) {
    return __frcp_rn(__fadd_rn(1, exp(__fneg_rn(x))));
}

__global__ void sigmoidBackward(float* R, float* V, int x, int y) {
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Define stride to handle larger arrays
    for (int i = index; i < x * y; i += stride) {
        R[i] = sigmoid_derivate(V[i]);
    }
}