#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float sigmoid(float x) {
    return 1.0f / (1 + __expf(-x));
}

__global__ void sigmoidActivationBackprop(float* Z, float* dA, float* dZ, int Z_x_dim, int Z_y_dim) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int total_elements = Z_x_dim * Z_y_dim;

    // Loop to cover entire matrix using grid stride
    for (; index < total_elements; index += blockDim.x * gridDim.x) {
        float sigmoid_value = sigmoid(Z[index]);
        dZ[index] = dA[index] * sigmoid_value * (1 - sigmoid_value);
    }
}