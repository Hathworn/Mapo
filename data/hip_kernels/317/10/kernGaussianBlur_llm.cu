#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernGaussianBlur(int width, int height, uint8_t * dst, uint8_t * src) {
    // Calculate pixel's location in the source image
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;
    
    // Exit if the thread is out of the image boundaries
    if (x >= width || y >= height) {
        return;
    }
    
    // Define Gaussian kernel
    __shared__ float kernel[5][5];
    kernel[0][0] = 0.003765; kernel[0][1] = 0.015019; kernel[0][2] = 0.023792; kernel[0][3] = 0.015019; kernel[0][4] = 0.003765;
    kernel[1][0] = 0.015019; kernel[1][1] = 0.059912; kernel[1][2] = 0.094907; kernel[1][3] = 0.059912; kernel[1][4] = 0.015019;
    kernel[2][0] = 0.023792; kernel[2][1] = 0.094907; kernel[2][2] = 0.150342; kernel[2][3] = 0.094907; kernel[2][4] = 0.023792;
    kernel[3][0] = 0.015019; kernel[3][1] = 0.059912; kernel[3][2] = 0.094907; kernel[3][3] = 0.059912; kernel[3][4] = 0.015019;
    kernel[4][0] = 0.003765; kernel[4][1] = 0.015019; kernel[4][2] = 0.023792; kernel[4][3] = 0.015019; kernel[4][4] = 0.003765;
    
    // Initialize RGB values
    float r = 0.0f, g = 0.0f, b = 0.0f;
    
    // Compute Gaussian blur
    for (int i = 0; i < 5; i++) {
        int tx = x + i - 2;
        for (int j = 0; j < 5; j++) {
            int ty = y + j - 2;
            if (tx >= 0 && ty >= 0 && tx < width && ty < height) {
                int srcIdx = (ty * width + tx) * 3;
                r += src[srcIdx] * kernel[i][j];
                g += src[srcIdx + 1] * kernel[i][j];
                b += src[srcIdx + 2] * kernel[i][j];
            }
        }
    }
    
    // Assign computed color to destination image
    int idx = 3 * (y * width + x);
    dst[idx] = __saturatef(r);
    dst[idx + 1] = __saturatef(g);
    dst[idx + 2] = __saturatef(b);
}