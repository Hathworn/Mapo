#include "hip/hip_runtime.h"
#include "includes.h"

// Function to convert HSV to RGB
__device__ float3 hsv_to_rgb_kernel(float3 hsv)
{
    float h = hsv.x;
    float s = hsv.y;
    float v = hsv.z;

    float r, g, b;
    float f, p, q, t;

    // Check saturation
    if (s == 0) {
        r = g = b = v; // Achromatic case
    } else {
        int index = (int) floorf(h); // Calculate index for hue
        f = h - index; // Fractional part of hue
        p = v * (1 - s);
        q = v * (1 - s * f);
        t = v * (1 - s * (1 - f));

        // Use index to select RGB values
        if (index == 0) {
            r = v; g = t; b = p;
        } else if (index == 1) {
            r = q; g = v; b = p;
        } else if (index == 2) {
            r = p; g = v; b = t;
        } else if (index == 3) {
            r = p; g = q; b = v;
        } else if (index == 4) {
            r = t; g = p; b = v;
        } else {
            r = v; g = p; b = q; // Default case
        }
    }

    // Clamp RGB values to [0, 1] range
    r = (r < 0) ? 0 : ((r > 1) ? 1 : r);
    g = (g < 0) ? 0 : ((g > 1) ? 1 : g);
    b = (b < 0) ? 0 : ((b > 1) ? 1 : b);

    return make_float3(r, g, b);
}

// Function to convert RGB to HSV
__device__ float3 rgb_to_hsv_kernel(float3 rgb)
{
    float r = rgb.x;
    float g = rgb.y;
    float b = rgb.z;

    float h, s, v;
    float max = fmaxf(fmaxf(r, g), b); // Calculate max value
    float min = fminf(fminf(r, g), b); // Calculate min value
    float delta = max - min; // Compute delta
    v = max;

    // Check if max is zero
    if (max == 0) {
        s = 0;
        h = -1;
    } else {
        s = delta / max; // Saturation calculation
        // Hue calculations based on the RGB component with max value
        if (r == max) {
            h = (g - b) / delta;
        } else if (g == max) {
            h = 2 + (b - r) / delta;
        } else {
            h = 4 + (r - g) / delta;
        }
        if (h < 0) h += 6; // Ensure h is positive
    }

    return make_float3(h, s, v);
}

// Optimized global kernel function for image manipulation
__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Compute unique thread ID

    if (id >= size) return; // Out of bounds check

    int x = id % w;
    id /= w;
    int y = id % h;
    id /= h;

    float rshift = rand[0];
    float gshift = rand[1];
    float bshift = rand[2];
    float r0 = rand[8 * id];
    float r1 = rand[8 * id + 1];
    float r2 = rand[8 * id + 2];
    float r3 = rand[8 * id + 3];

    // Adjust saturation based on random values
    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > 0.5) ? 1.0 / saturation : saturation;
    // Adjust exposure based on random values
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > 0.5) ? 1.0 / exposure : exposure;

    size_t offset = id * h * w * 3; // Calculate image offset
    image += offset;

    float r = image[x + w * (y + 0 * h)];
    float g = image[x + w * (y + 1 * h)];
    float b = image[x + w * (y + 2 * h)];
    float3 rgb = make_float3(r, g, b);

    // Apply training transformations
    if (train) {
        float3 hsv = rgb_to_hsv_kernel(rgb); // Convert RGB to HSV
        hsv.y *= saturation; // Adjust saturation
        hsv.z *= exposure; // Adjust exposure
        rgb = hsv_to_rgb_kernel(hsv); // Convert HSV back to RGB
    } else {
        shift = 0;
    }

    // Apply transformations and write back to image
    image[x + w * (y + 0 * h)] = rgb.x * scale + translate + (rshift - 0.5) * shift;
    image[x + w * (y + 1 * h)] = rgb.y * scale + translate + (gshift - 0.5) * shift;
    image[x + w * (y + 2 * h)] = rgb.z * scale + translate + (bshift - 0.5) * shift;
}