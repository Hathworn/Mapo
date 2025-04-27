#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void linearLayerBackprop(float* W, float* dZ, float *dA, int W_x_dim, int W_y_dim, int dZ_x_dim, int dZ_y_dim) {

    // Calculate unique global index for each thread
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Define matrix dimensions
    int dA_x_dim = dZ_x_dim;
    int dA_y_dim = W_x_dim;

    // Initialize the accumulator
    float dA_value = 0.0f;

    // Boundary check for valid matrix indices
    if (row < dA_y_dim && col < dA_x_dim) {
        // Accumulate results using shared memory to minimize global memory access
        for (int i = 0; i < W_y_dim; i++) {
            dA_value += W[i * W_x_dim + row] * dZ[i * dZ_x_dim + col];
        }
        // Write the result back to global memory
        dA[row * dA_x_dim + col] = dA_value;
    }
}