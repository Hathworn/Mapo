#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tanhActivationBackprop(float* Z, float* dA, float* dZ, int Z_x_dim, int Z_y_dim) {
    // Calculate the global index for the thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within the bounds of the input matrices
    if (index < Z_x_dim * Z_y_dim) {
        // Precompute reused value for performance
        float d = Z[index];
        float oneMinusSquareD = 1 - d * d;
        
        // Update dZ using the backpropagation formula
        dZ[index] = dA[index] * oneMinusSquareD;
    }
}