#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mirrorImage_kernel(uint width, uint height, uint border, uint borderWidth, uint borderHeight, float* devInput, float* devOutput) {
    int x0 = blockDim.x * blockIdx.x + threadIdx.x;
    int y0 = blockDim.y * blockIdx.y + threadIdx.y;

    // Limit processing to threads that fall within the border region
    if ((x0 < borderWidth) && (y0 < borderHeight)) {
        int x1, y1;

        // Calculate mirrored x-coordinate
        if (x0 < border) {
            x1 = border - x0 - 1;
        } else if (x0 >= border + width) {
            x1 = border + 2 * width - x0 - 1;
        } else {
            x1 = x0 - border;
        }

        // Calculate mirrored y-coordinate
        if (y0 < border) {
            y1 = border - y0 - 1;
        } else if (y0 >= border + height) {
            y1 = border + 2 * height - y0 - 1;
        } else {
            y1 = y0 - border;
        }

        // Assign the mirrored pixel value
        devOutput[y0 * borderWidth + x0] = devInput[y1 * width + x1];
    }
}