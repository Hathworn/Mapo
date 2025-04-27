```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void linearLayerUpdateWeights(float* dZ, float* A, float* W, int dZ_x_dim, int dZ_y_dim, int A_x_dim, int A_y_dim, float learning_rate) {

    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    int W_x_dim = A_y_dim;
    int W_y_dim = dZ_y_dim;

    if (row < W_y_dim && col < W_x_dim) {
        float dW_value = 0.0f;
        for (int i = 0; i < dZ_x_dim; i++) {
            // Optimize by reducing memory reads using registers
            float dZ_value = dZ[row * dZ_x_dim + i];
            float A_value = A[col * A_x_dim + i];
            dW_value += dZ_value * A_value;
        }
        // Perform update with learning rate outside the loop
        W[row * W_x_dim + col] -= learning_rate * (dW_value / A_x_dim);
    }
}