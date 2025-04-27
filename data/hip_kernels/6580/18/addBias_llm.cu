#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addBias(float* Z, float* b, int Z_x_dim, int Z_y_dim) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Apply bias only for valid indices
    if (index < Z_x_dim * Z_y_dim) {
        int row = index / Z_x_dim;
        int col = index % Z_x_dim;
        Z[row * Z_x_dim + col] += b[row];
    }
}