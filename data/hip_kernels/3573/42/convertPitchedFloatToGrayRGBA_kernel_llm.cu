#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertPitchedFloatToGrayRGBA_kernel(uchar4 *out_image, const float *in_image, int width, int height, int pitch, float lowerLim, float upperLim) {
    // Calculate unique thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        // Optimize memory access by using pitched pointer arithmetic
        float val = *((float *)((char *)in_image + y * pitch) + x);

        // Rescale value to [0,255]
        val = (val - lowerLim) / (upperLim - lowerLim) * 255.0f;

        // Assign result to output image
        uchar4 temp;
        temp.x = temp.y = temp.z = static_cast<unsigned char>(val);
        temp.w = 255;
        out_image[y * width + x] = temp;
    }
}