#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rgbUtoLab3F_kernel(int width, int height, float gamma, unsigned int* rgbU, float* devL, float* devA, float* devB) {
    int x0 = blockDim.x * blockIdx.x + threadIdx.x;
    int y0 = blockDim.y * blockIdx.y + threadIdx.y;

    if ((x0 < width) && (y0 < height)) {
        int index = y0 * width + x0;
        unsigned int rgb = rgbU[index];

        // Direct color channel calculation without intermediate variables
        float r = powf((float)(rgb & 0xff) / 255.0, gamma);
        float g = powf((float)((rgb & 0xff00) >> 8) / 255.0, gamma);
        float b = powf((float)((rgb & 0xff0000) >> 16) / 255.0, gamma);

        // Pre-computed coefficients multiplied directly with the components
        float x = (0.412453f * r) +  (0.357580f * g) + (0.180423f * b);
        float y = (0.212671f * r) +  (0.715160f * g) + (0.072169f * b);
        float z = (0.019334f * r) +  (0.119193f * g) + (0.950227f * b);

        // Constants moved outside loop as they don't change across threads
        const float x_ref = 0.950456f;
        const float y_ref = 1.000000f;
        const float z_ref = 1.088754f;
        const float threshold = 0.008856f;

        // Normalize color coordinates by reference values
        x /= x_ref;
        y /= y_ref;
        z /= z_ref;

        // Use ternary operator for inlining conditional logic
        float fx = (x > threshold) ? cbrtf(x) : (7.787f * x + (16.0f / 116.0f));
        float fy = (y > threshold) ? cbrtf(y) : (7.787f * y + (16.0f / 116.0f));
        float fz = (z > threshold) ? cbrtf(z) : (7.787f * z + (16.0f / 116.0f));

        // Calculate Lab components directly storing in global memory
        devL[index] = (y > threshold) ? (116 * cbrtf(y) - 16) : (903.3f * y);
        devA[index] = 500.0f * (fx - fy);
        devB[index] = 200.0f * (fy - fz);
    }
}