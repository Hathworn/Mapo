#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmaxActivationBackprop(float* Z, float* dA, float* dZ, int Z_x_dim, int Z_y_dim) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Ensure all elements are processed with stride-based looping
    for (int i = index; i < Z_x_dim * Z_y_dim; i += stride) {
        dZ[i] = dA[i];
    }
}