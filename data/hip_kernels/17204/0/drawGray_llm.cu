#include "hip/hip_runtime.h"
#include "includes.h"

/*****************************************************************************/

/*****************************************************************************/

/*****************************************************************************/
__global__ void drawGray(unsigned char* optr, const float* outSrc) {
    // map from threadIdx/BlockIdx to pixel position
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;
    int offset = x + y * blockDim.x * gridDim.x;

    if (x < gridDim.x * blockDim.x && y < gridDim.y * blockDim.y) {
        // Scale and clamp the value to [0, 1]
        float val = fminf(fmaxf((outSrc[offset] / 50.0f) + 0.5f, 0.0f), 1.0f);

        unsigned char pixelValue = static_cast<unsigned char>(255 * val);

        optr[offset * 4 + 0] = pixelValue; // red
        optr[offset * 4 + 1] = pixelValue; // green
        optr[offset * 4 + 2] = pixelValue; // blue
        optr[offset * 4 + 3] = 255;        // alpha (opacity)
    }
}