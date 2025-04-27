#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void detect_edges(unsigned char* in, unsigned char* out, int width, int height) {
    int x = blockIdx.x * blockDim.x + threadIdx.x; // Calculate x
    int y = blockIdx.y * blockDim.y + threadIdx.y; // Calculate y

    if (x >= width || y >= height) return; // Check bounds

    int i = y * width + x; // Flatten y and x to get 1D index
    if (x == 0 || y == 0 || x == width - 1 || y == height - 1) {
        out[i] = 0; // Handle border pixels
    } else {
        int b = i + width;
        int d = i - 1;
        int f = i + 1;
        int h = i - width;

        int r = (in[i] * 4) + (in[b] * -1) + (in[d] * -1) + (in[f] * -1) + (in[h] * -1); // Convolution

        out[i] = (r > 0) ? 255 : 0; // Set output
    }
}