#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimization
__global__ void vec_addPhotonsAndBackgroundMany_f(int n, int sizeSubImage, float *output, float *input, float *photonAndBackground) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = idy * gridDim.x * blockDim.x + idx;

    if (id < n) {
        // Calculate id2 to avoid repeated division operations
        int id2 = __float2int_rd(__fdiv_rd(static_cast<float>(id), static_cast<float>(sizeSubImage)));
        // Update output using precomputed id2
        output[id] = input[id] * photonAndBackground[id2 * 2] + photonAndBackground[id2 * 2 + 1];
    }
}