#include "hip/hip_runtime.h"
#include "includes.h"

#define threadsPerBlock 22

__device__ int pixelIndex(int x, int y, int width) {
    return (y * width + x);
}

__global__ void sobel(char* returnPixels, int width, char* pixels) {
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    // Check bounds to prevent access outside image boundaries
    if (x >= 1 && x < width - 1 && y >= 1 && y < width - 1) {
        int x00 = -1, x20 = 1;
        int x01 = -2, x21 = 2;
        int x02 = -1, x22 = 1;

        int y00 = -1, y10 = -2, y20 = -1;
        int y02 = 1, y12 = 2, y22 = 1;

        // Reduce repetitive calculations by prefetching values into variables
        int xm1_ym1 = pixels[pixelIndex(x - 1, y - 1, width)];
        int xm1_y = pixels[pixelIndex(x - 1, y, width)];
        int xm1_yp1 = pixels[pixelIndex(x - 1, y + 1, width)];
        int x_y = pixels[pixelIndex(x, y, width)];
        int x_yp1 = pixels[pixelIndex(x, y + 1, width)];
        int xp1_y = pixels[pixelIndex(x + 1, y, width)];
        int xp1_ym1 = pixels[pixelIndex(x + 1, y - 1, width)];
        int xp1_yp1 = pixels[pixelIndex(x + 1, y + 1, width)];

        int px = x00 * xm1_ym1 + x01 * xm1_y + x02 * xm1_yp1 + x20 * xp1_ym1 + x21 * xp1_y + x22 * xp1_yp1;
        int py = y00 * xm1_ym1 + y10 * x_y + y20 * xp1_ym1 + y02 * xm1_yp1 + y12 * x_yp1 + y22 * xp1_yp1;

        returnPixels[pixelIndex(x, y, width)] = sqrtf(float(px * px + py * py));
    }
}