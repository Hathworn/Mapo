#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float relu(float a) {
    return a < 0 ? 0 : a;
}

// Improved kernel for relu_derivative
__global__ void relu_derivative(float *upper_grads, float *upper_values, unsigned int upper_size) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < upper_size) {
        upper_grads[index] = (upper_values[index] == 0) ? 0.0f : upper_grads[index]; // Use ternary operator for clarity
    }
}