```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rgb2yuv_kernel(int img_size, unsigned char *img_r, unsigned char *img_g, unsigned char *img_b, unsigned char *img_y, unsigned char *img_u, unsigned char *img_v) {
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds
    if (i < img_size) {
        // Read RGB values
        int r = img_r[i];
        int g = img_g[i];
        int b = img_b[i];

        // Compute YUV with precomputed constants and store
        img_y[i] = static_cast<unsigned char>(0.299f * r + 0.587f * g + 0.114f * b);
        img_u[i] = static_cast<unsigned char>(-0.169f * r - 0.331f * g + 0.499f * b + 128.0f);
        img_v[i] = static_cast<unsigned char>(0.499f * r - 0.418f * g - 0.0813f * b + 128.0f);
    }
}