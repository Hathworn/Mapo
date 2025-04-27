#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void convertFloatToRGBAbinary_kernel(uchar4 *out_image, const float *in_image, int width, int height, float lowerLim, float upperLim) {
    // Calculate global index using block and thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Proceed only if (x, y) is within image bounds
    if (x < width && y < height) {
        // Simplified index calculation
        int idx = y * width + x;
        float val = in_image[idx];

        uchar4 temp;
        // Set pixel to white if invalid or out of specified limits, otherwise black
        if (!isfinite(val) || val < lowerLim || val > upperLim) {
            temp = {255, 255, 255, 255};  // White
        } else {
            temp = {0, 0, 0, 0};          // Black
        }
        out_image[idx] = temp;
    }
}