#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernGaussianBlur(int width, int height, uint8_t * dst, uint8_t * src) {
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;
    if (x >= width || y >= height) {
        return;
    }

    // Pre-calculated constant kernel to avoid repetitive array initialization
    __shared__ float kernel[5][5];
    if (threadIdx.x < 5 && threadIdx.y < 5) {
        kernel[threadIdx.y][threadIdx.x] = 0;
        __syncthreads();
        if (threadIdx.y == 0) {
            kernel[0][0] = 0.003765f; kernel[0][1] = 0.015019f; kernel[0][2] = 0.023792f;
            kernel[0][3] = 0.015019f; kernel[0][4] = 0.003765f;
        }
        if (threadIdx.y == 1) {
            kernel[1][0] = 0.015019f; kernel[1][1] = 0.059912f; kernel[1][2] = 0.094907f;
            kernel[1][3] = 0.059912f; kernel[1][4] = 0.015019f;
        }
        if (threadIdx.y == 2) {
            kernel[2][0] = 0.023792f; kernel[2][1] = 0.094907f; kernel[2][2] = 0.150342f;
            kernel[2][3] = 0.094907f; kernel[2][4] = 0.023792f;
        }
        if (threadIdx.y == 3) {
            kernel[3][0] = 0.015019f; kernel[3][1] = 0.059912f; kernel[3][2] = 0.094907f;
            kernel[3][3] = 0.059912f; kernel[3][4] = 0.015019f;
        }
        if (threadIdx.y == 4) {
            kernel[4][0] = 0.003765f; kernel[4][1] = 0.015019f; kernel[4][2] = 0.023792f;
            kernel[4][3] = 0.015019f; kernel[4][4] = 0.003765f;
        }
    }
    __syncthreads();

    float r = 0.0f, g = 0.0f, b = 0.0f;
    // Loop optimization: combining boundary check and computation
    for (int i = 0; i < 5; ++i) {
        int tx = x + i - 2;
        if (tx >= 0 && tx < width) {
            for (int j = 0; j < 5; ++j) {
                int ty = y + j - 2;
                if (ty >= 0 && ty < height) {
                    int index = (ty * width + tx) * 3;
                    r += src[index] * kernel[i][j];
                    g += src[index + 1] * kernel[i][j];
                    b += src[index + 2] * kernel[i][j];
                }
            }
        }
    }
    int idx = 3 * (y * width + x);
    dst[idx] = (uint8_t)r;
    dst[idx + 1] = (uint8_t)g;
    dst[idx + 2] = (uint8_t)b;
    return;
}