#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reluActivationForward(float* Z, float* A, int Z_x_dim, int Z_y_dim) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;  // Calculate stride for loop unrolling
    for (int i = index; i < Z_x_dim * Z_y_dim; i += stride) {
        A[i] = fmaxf(Z[i], 0);  // Apply ReLU activation
    }
}