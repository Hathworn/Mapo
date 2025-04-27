#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void linearLayerForward(float* W, float* A, float* Z, float* b, int W_x_dim, int W_y_dim, int A_x_dim, int A_y_dim) {

    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    int Z_x_dim = A_x_dim;
    int Z_y_dim = W_y_dim;

    float Z_value = 0;

    // Use shared memory to optimize memory access
    __shared__ float shared_W[32][32]; // Adjust size as needed
    __shared__ float shared_A[32][32]; // Adjust size as needed

    for (int i = 0; i < (W_x_dim + 31) / 32; ++i) { // Loop over tiles
        if (i * 32 + threadIdx.x < W_x_dim && row < Z_y_dim) {
            shared_W[threadIdx.y][threadIdx.x] = W[row * W_x_dim + i * 32 + threadIdx.x];
        } else {
            shared_W[threadIdx.y][threadIdx.x] = 0.0f;
        }

        if (i * 32 + threadIdx.y < W_x_dim && col < Z_x_dim) {
            shared_A[threadIdx.y][threadIdx.x] = A[(i * 32 + threadIdx.y) * A_x_dim + col];
        } else {
            shared_A[threadIdx.y][threadIdx.x] = 0.0f;
        }

        __syncthreads();

        for (int j = 0; j < 32; ++j) {
            Z_value += shared_W[threadIdx.y][j] * shared_A[j][threadIdx.x];
        }

        __syncthreads();
    }

    if (row < Z_y_dim && col < Z_x_dim) {
        Z[row * Z_x_dim + col] = Z_value + b[row];
    }
}