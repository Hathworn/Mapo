#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void blendFloatImageFloatLabelToRGBA_kernel(uchar4 *out_image, const float *in_image, const float *label, int width, int height, float lowerLim, float upperLim) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        int index = y * width + x;
        unsigned char img = static_cast<unsigned char>(0.5f * in_image[index] + 128.0f);
        float val = label[index];

        uchar4 temp;
        if (!isfinite(val) || (val < lowerLim) || (val > upperLim)) {
            // Set all out-of-range or invalid values to white
            temp = make_uchar4(img, img, img, 255);
        } else {
            // Blend valid values
            temp = make_uchar4(static_cast<unsigned char>(0.6f * img),
                               static_cast<unsigned char>(0.6f * img),
                               img, 255);
        }

        out_image[index] = temp;
    }
}
```
