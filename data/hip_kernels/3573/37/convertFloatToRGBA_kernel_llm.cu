#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void convertFloatToRGBA_kernel(uchar4 *out_image, const float *in_image, int width, int height, float lowerLim, float upperLim) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify index calculation
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    uchar4 temp;
    if (x < width && y < height) {
        float val = in_image[y * width + x];

        if (!isfinite(val)) {
            temp = make_uchar4(255, 255, 255, 255);  // Use make_uchar4 for initialization
        } else {
            val = (val - lowerLim) / (upperLim - lowerLim);  // Combine operations
            float r, g, b;
            if (val < 0.25f) {
                r = 0;
                g = 4.0f * val;
                b = 1.0f;
            } else if (val < 0.5f) {
                r = 0;
                g = 1.0f;
                b = 1.0f + 4.0f * (0.25f - val);
            } else if (val < 0.75f) {
                r = 4.0f * (val - 0.5f);
                g = 1.0f;
                b = 0;
            } else {
                r = 1.0f;
                g = 1.0f + 4.0f * (0.75f - val);
                b = 0;
            }
            temp = make_uchar4(255.0f * r, 255.0f * g, 255.0f * b, 255);  // Simplify assignment
        }
        out_image[y * width + x] = temp;
    }
}