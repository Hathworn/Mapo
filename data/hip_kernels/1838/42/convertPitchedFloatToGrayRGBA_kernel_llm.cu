#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void convertPitchedFloatToGrayRGBA_kernel(uchar4 *out_image, const float *in_image, int width, int height, int pitch, float lowerLim, float upperLim) {
    // Calculate global thread index using built-in functions
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        // Compute input index and access float value directly
        float val = *((float *)((char *)in_image + y * pitch) + x);

        // Rescale value from [lowerLim, upperLim] to [0, 255]
        val = 255.0f * (val - lowerLim) / (upperLim - lowerLim);
        val = max(0.0f, min(255.0f, val)); // Clamp to [0, 255]

        uchar4 temp;
        temp.x = (unsigned char)val;
        temp.y = (unsigned char)val;
        temp.z = (unsigned char)val;
        temp.w = 255;

        // Output index calculation using faster arithmetic
        out_image[y * width + x] = temp;
    }
}