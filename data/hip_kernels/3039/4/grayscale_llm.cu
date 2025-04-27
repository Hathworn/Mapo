#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void grayscale(unsigned char *src, unsigned char *dest, int width, int height, int nChannels) {
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure threads processing valid pixels
    if (y >= height || x >= width) return;
    
    int pos = (y * width + x) * nChannels;
    
    // Use registers to store pixel values
    float r = src[pos + 2];
    float g = src[pos + 1];
    float b = src[pos + 0];
    
    // Pre-compute for efficiency and apply fminf to ensure max value is 255
    float tr = fminf(0.393f * r + 0.769f * g + 0.189f * b, 255.0f);
    float tg = fminf(0.349f * r + 0.686f * g + 0.168f * b, 255.0f);
    float tb = fminf(0.272f * r + 0.534f * g + 0.131f * b, 255.0f);
    
    dest[pos + 2] = static_cast<unsigned char>(tr);
    dest[pos + 1] = static_cast<unsigned char>(tg);
    dest[pos + 0] = static_cast<unsigned char>(tb);
}