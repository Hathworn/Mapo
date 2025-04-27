```c
#include "hip/hip_runtime.h"
#include "includes.h"
// vim: ts=4 syntax=cpp comments=

#define XBLOCK 16
#define YBLOCK 16

__global__ void rgbUtoLab3F_kernel(int width, int height, float gamma, unsigned int* rgbU, float* devL, float* devA, float* devB) {
    int x0 = blockDim.x * blockIdx.x + threadIdx.x;
    int y0 = blockDim.y * blockIdx.y + threadIdx.y;

    if ((x0 < width) && (y0 < height)) {
        int index = y0 * width + x0;
        unsigned int rgb = rgbU[index];

        // Use bit manipulations directly and precompute division
        float divisor = 1.0f / 255.0f;
        float r = ((rgb & 0xff) * divisor);
        float g = (((rgb & 0xff00) >> 8) * divisor);
        float b = (((rgb & 0xff0000) >> 16) * divisor);

        // Inline powf for gamma correction to avoid multiple calls
        r = powf(r, gamma);
        g = powf(g, gamma);
        b = powf(b, gamma);

        float x = (0.412453f * r) + (0.357580f * g) + (0.180423f * b);
        float y = (0.212671f * r) + (0.715160f * g) + (0.072169f * b);
        float z = (0.019334f * r) + (0.119193f * g) + (0.950227f * b);

        // Pre-defined constants moved for optimization
        const float x_ref = 0.950456f;
        const float y_ref = 1.0f;
        const float z_ref = 1.088754f;
        const float threshold = 0.008856f;

        // Normalize using precomputed constants
        x /= x_ref;
        y /= y_ref;
        z /= z_ref;

        // Ternary operations simplified by inline ternary comparisons
        float fx = (x > threshold) ? cbrtf(x) : (7.787f * x + 0.13793f);
        float fy = (y > threshold) ? cbrtf(y) : (7.787f * y + 0.13793f);
        float fz = (z > threshold) ? cbrtf(z) : (7.787f * z + 0.13793f);

        // Compute Lab values; avoid repeated computations and improve readbility
        devL[index] = (y > threshold) ? (116.0f * cbrtf(y) - 16.0f) : (903.3f * y);
        devA[index] = 500.0f * (fx - fy);
        devB[index] = 200.0f * (fy - fz);
    }
}