#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void convertPitchedFloatToRGBA_kernel(uchar4 *out_image, const float *in_image, int width, int height, int pitch, float lowerLim, float upperLim) {
    // Calculate flattened thread index
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < width && y < height) {
        uchar4 temp;
        float val = *((float *)((char *)in_image + y * pitch) + x);

        // Check if value is finite, otherwise set white
        if (!isfinite(val)) {
            temp = make_uchar4(255, 255, 255, 255);
        } else {
            // Rescale value from [lowerLim, upperLim] to [0,1]
            val = (val - lowerLim) / (upperLim - lowerLim);

            float r = 1.0f, g = 1.0f, b = 1.0f;
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
            // Set RGBA values
            temp = make_uchar4(__float2int_rn(255.0f * r), __float2int_rn(255.0f * g), __float2int_rn(255.0f * b), 255);
        }
        // Assign pixel value in output image
        out_image[y * width + x] = temp;
    }
}