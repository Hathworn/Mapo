#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void linearLayerUpdateBias(float* dZ, float* b, int dZ_x_dim, int dZ_y_dim, int b_x_dim, float learning_rate) {
    int dZ_y = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Iterate over the x dimension within a thread
    if (dZ_y < dZ_y_dim) {
        float sum = 0.0f;
        for (int dZ_x = 0; dZ_x < dZ_x_dim; ++dZ_x) {
            sum += dZ[dZ_y * dZ_x_dim + dZ_x];
        }
        // Use atomic operation to update b
        atomicAdd(&b[dZ_y], -learning_rate * (sum / dZ_x_dim));
    }
}