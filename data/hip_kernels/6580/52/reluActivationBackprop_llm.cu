#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reluActivationBackprop(float* Z, float* dA, float* dZ, int Z_x_dim, int Z_y_dim) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int total_size = Z_x_dim * Z_y_dim;

    // Use threadIdx and blockIdx for parallel execution and boundary checking
    if (index < total_size) {
        // Use ternary operator for concise conditional operation
        dZ[index] = Z[index] > 0 ? dA[index] : 0;
    }
}