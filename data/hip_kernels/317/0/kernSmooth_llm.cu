```c
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

__global__ void kernSmooth(int N, int width, int height, unsigned char *in, unsigned char *out, const float *kernel, int kernSize) {
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;
    if (x >= width || y >= height) return;

    // Initialize accumulation variable
    float c = 0.0f;
    int halfKern = kernSize / 2;

    // Iterate over kernel
    for (int i = -halfKern; i <= halfKern; i++) {
        int tx = x + i;
        if (tx >= 0 && tx < width) {
            for (int j = -halfKern; j <= halfKern; j++) {
                int ty = y + j;
                if (ty >= 0 && ty < height) {
                    // Accumulate weighted sum
                    c += in[ty * width + tx] * kernel[(j + halfKern) * kernSize + (i + halfKern)];
                }
            }
        }
    }

    // Store the absolute value of the result
    out[y * width + x] = fabs(c);
}