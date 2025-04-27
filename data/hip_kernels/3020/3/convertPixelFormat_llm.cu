#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertPixelFormat(uint8_t* inputBgra, uint8_t* outputYuv, int numPixels) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;
    
    // Optimize by unrolling the conversion loop for better performance
    for (; idx < numPixels; idx += stride) {
        short3 yuv16;
        char3 yuv8;

        // Load input only once per pixel and store in registers
        uint8_t b = inputBgra[idx * 4];
        uint8_t g = inputBgra[idx * 4 + 1];
        uint8_t r = inputBgra[idx * 4 + 2];

        // Efficient YUV conversion
        yuv16.x = 66 * r + 129 * g + 25 * b;
        yuv16.y = -38 * r - 74 * g + 112 * b;
        yuv16.z = 112 * r - 94 * g - 18 * b;

        // Normalize and offset YUV values
        yuv8.x = (yuv16.x >> 8) + 16;
        yuv8.y = (yuv16.y >> 8) + 128;
        yuv8.z = (yuv16.z >> 8) + 128;

        // Output result
        *(reinterpret_cast<char3*>(&outputYuv[idx * 3])) = yuv8;
    }
}