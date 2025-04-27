#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernGaussianBlur(int width, int height, uint8_t* dst, uint8_t* src, int kernSize, float* kernel) {
    // Calculate absolute position in the image
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    // Early exit for out-of-bounds threads
    if (x >= width || y >= height) return;

    float r = 0.0f, g = 0.0f, b = 0.0f;

    // Loop over the kernel
    for (int i = 0; i < kernSize; i++) {
        int tx = x + i - kernSize / 2;
        for (int j = 0; j < kernSize; j++) {
            int ty = y + j - kernSize / 2;
            if (tx >= 0 && ty >= 0 && tx < width && ty < height) {
                int srcIdx = (ty * width + tx) * 3;
                float kernelVal = kernel[j * kernSize + i];
                r += src[srcIdx] * kernelVal;
                g += src[srcIdx + 1] * kernelVal;
                b += src[srcIdx + 2] * kernelVal;
            }
        }
    }

    // Calculate output index and assign values
    int idx = 3 * (y * width + x);
    dst[idx] = r;
    dst[idx + 1] = g;
    dst[idx + 2] = b;
}