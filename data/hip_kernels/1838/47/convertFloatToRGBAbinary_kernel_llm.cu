#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertFloatToRGBAbinary_kernel(uchar4 *out_image, const float *in_image, int width, int height, float lowerLim, float upperLim) {
    // Calculate the index using modern syntax and avoiding deprecated __mul24
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < width && y < height) {
        int index = y * width + x;
        float val = in_image[index];
        uchar4 temp;

        // Use single condition to initialize temp directly
        if (!isfinite(val) || val < lowerLim || val > upperLim) {
            temp = make_uchar4(255, 255, 255, 255); // White color
        } else {
            temp = make_uchar4(0, 0, 0, 0); // Black color
        }
        out_image[index] = temp;
    }
}