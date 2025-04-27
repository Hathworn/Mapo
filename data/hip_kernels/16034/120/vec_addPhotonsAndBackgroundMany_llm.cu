#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void vec_addPhotonsAndBackgroundMany(int n, int sizeSubImage, double *output, double *input, double *photonAndBackground) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread is within bounds
    if (id < n) {
        int id2 = id / sizeSubImage;

        // Simplified computation using pointer arithmetic
        double photonAndBack = photonAndBackground[id2 * 2];
        double background = photonAndBackground[id2 * 2 + 1];
        
        output[id] = input[id] * photonAndBack + background;
    }
}