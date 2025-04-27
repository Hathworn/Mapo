#include "hip/hip_runtime.h"
#include "includes.h"

#define UPPERTHRESHOLD 90
#define LOWERTHRESHOLD 30

const float G_x[3 * 3] = {
-1, 0, 1,
-2, 0, 2,
-1, 0, 1
};

const float G_y[3 * 3] = {
1, 2, 1,
0, 0, 0,
-1, -2, -1
};

const float gaussian[5 * 5] = {
2.f/159, 4.f/159, 5.f/159, 4.f/159, 2.f/159,
4.f/159, 9.f/159, 12.f/159, 9.f/159, 4.f/159,
5.f/159, 12.f/159, 15.f/159, 12.f/159, 2.f/159,
4.f/159, 9.f/159, 12.f/159, 9.f/159, 4.f/159,
2.f/159, 4.f/159, 5.f/159, 4.f/159, 2.f/159
};

__global__ void nonMaxSuppression(int N, int width, int height, unsigned char * in, unsigned char * out) {
    int D = 1;
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;
    
    // Ensure the thread is within valid pixel range
    if (x >= width || y >= height) return;

    int idx = y * width + x;
    int angle = in[idx];
    unsigned char currentPixel = out[idx];

    // Perform non-maximum suppression based on the angle
    if (angle == 0) {
        if (currentPixel < out[(y + D) * width + x] || currentPixel < out[(y - D) * width + x]) {
            out[idx] = 0;
        }
    } else if (angle == 45) {
        if (currentPixel < out[(y + D) * width + x - D] || currentPixel < out[(y - D) * width + x + D]) {
            out[idx] = 0;
        }
    } else if (angle == 90) {
        if (currentPixel < out[y * width + (x + D)] || currentPixel < out[y * width + (x - D)]) {
            out[idx] = 0;
        }
    } else if (angle == 135) {
        if (currentPixel < out[(y + D) * width + x + D] || currentPixel < out[(y - D) * width + x - D]) {
            out[idx] = 0;
        }
    }
}