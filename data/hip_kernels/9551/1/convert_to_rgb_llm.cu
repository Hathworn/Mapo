#include "hip/hip_runtime.h"
#include "includes.h"
typedef enum color {BLUE, GREEN, RED} Color;

__global__ void convert_to_rgb(float *hsv, unsigned char *dest, int width, int height, int step, int channels) {
    // Calculate global index for processing
    int ren = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if the thread is within bounds
    if (ren < height && col < width) {
        float r, g, b;
        float h = hsv[(ren * step) + (col * channels) + RED];
        float s = hsv[(ren * step) + (col * channels) + GREEN];
        float v = hsv[(ren * step) + (col * channels) + BLUE];

        // use efficient modulo and division
        float f = h / 60.0f;
        float hi = __float2int_rd(f) % 6;
        f = f - hi;
        float p = v * (1 - s);
        float q = v * (1 - s * f);
        float t = v * (1 - s * (1 - f));

        // Simplified assignment using switch-case
        switch ((int)hi) {
            case 0: r = v; g = t; b = p; break;
            case 1: r = q; g = v; b = p; break;
            case 2: r = p; g = v; b = t; break;
            case 3: r = p; g = q; b = v; break;
            case 4: r = t; g = p; b = v; break;
            case 5: r = v; g = p; b = q; break;
        }

        // Efficient conversion and assignment
        dest[(ren * step) + (col * channels) + RED] = (unsigned char) __float2uint_rn(255.0f * r);
        dest[(ren * step) + (col * channels) + GREEN] = (unsigned char) __float2uint_rn(255.0f * g);
        dest[(ren * step) + (col * channels) + BLUE] = (unsigned char) __float2uint_rn(255.0f * b);
    }
}