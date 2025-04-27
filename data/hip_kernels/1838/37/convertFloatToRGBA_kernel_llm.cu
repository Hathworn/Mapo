#include "hip/hip_runtime.h"
#include "includes.h"

#define IDX(x, y, width) ((y) * (width) + (x))

__global__ void convertFloatToRGBA_kernel(uchar4 *out_image, const float *in_image, int width, int height, float lowerLim, float upperLim) {
    // Calculate 1D index within the current block based on linearized thread index
    int idx = IDX(__mul24(blockIdx.y, blockDim.y) + threadIdx.y, 
                  __mul24(blockIdx.x, blockDim.x) + threadIdx.x, width);

    // Check if idx is within image bounds
    if (idx >= width * height) return;

    uchar4 temp;
    float val = in_image[idx];

    if (!isfinite(val)) {  // If value is not finite, set to white
        temp = make_uchar4(255, 255, 255, 255);
    } else {
        // Normalize value from [lowerLim, upperLim] to [0, 1]
        val = (val - lowerLim) / (upperLim - lowerLim);

        float r = 1.0f, g = 1.0f, b = 1.0f;
        // Map value to RGB using conditional ranges
        if (val < 0.25f) {
            r = 0;
            g = 4.0f * val;
        } else if (val < 0.5f) {
            r = 0;
            b = 1.0 + 4.0f * (0.25f - val);
        } else if (val < 0.75f) {
            r = 4.0f * (val - 0.5f);
            b = 0;
        } else {
            g = 1.0f + 4.0f * (0.75f - val);
            b = 0;
        }
        temp = make_uchar4(255.0 * r, 255.0 * g, 255.0 * b, 255);
    }

    out_image[idx] = temp;  // Assign computed color to output
}