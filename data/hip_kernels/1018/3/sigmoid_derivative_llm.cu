#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float sigmoid(float a) {
    return 1.0 / (1.0 + exp (-a));
}

__global__ void sigmoid_derivative(float *upper_grads, float *upper_values, unsigned int upper_size) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use warp shuffle to calculate in parallel if possible
    if (index < upper_size) {
        float val = upper_values[index];
        upper_grads[index] *= val * (1.0f - val);
    }
}