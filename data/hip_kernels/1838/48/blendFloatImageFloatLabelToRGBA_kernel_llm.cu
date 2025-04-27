#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blendFloatImageFloatLabelToRGBA_kernel(uchar4 *out_image, const float *in_image, const float *label, int width, int height, float lowerLim, float upperLim) {
    // Use efficient calculation for thread index
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    const int idx = y * width + x;  // Calculate index once
    
    if (x < width && y < height) {
        unsigned char img = static_cast<unsigned char>(0.5f * in_image[idx] + 128.0f);
        float val = label[idx];
        
        uchar4 temp;
        // Simplify blend conditions
        if (!isfinite(val) || (val < lowerLim) || (val > upperLim)) {
            temp = make_uchar4(img, img, img, 255);
        } else {
            temp = make_uchar4(static_cast<unsigned char>(0.6f * img), static_cast<unsigned char>(0.6f * img), img, 255);
        }
        
        out_image[idx] = temp;
    }
}