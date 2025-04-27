#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float3 hsv_to_rgb_kernel(float3 hsv)
{
    float h = hsv.x, s = hsv.y, v = hsv.z;
    float r, g, b;

    if (s == 0) {
        r = g = b = v;
    } else {
        int index = floorf(h);
        float f = h - index;
        float p = v * (1 - s);
        float q = v * (1 - s * f);
        float t = v * (1 - s * (1 - f));

        // Simplified switch case using lookup table logic
        r = (index == 0 || index == 5) ? v : (index == 1 || index == 4) ? q : p;
        g = (index == 1 || index == 2) ? v : (index == 0 || index == 3) ? t : p;
        b = (index == 3 || index == 4) ? v : (index == 2 || index == 5) ? t : q;
    }

    // Clamp color values
    return make_float3(fminf(fmaxf(r, 0.0f), 1.0f), fminf(fmaxf(g, 0.0f), 1.0f), fminf(fmaxf(b, 0.0f), 1.0f));
}

__device__ float3 rgb_to_hsv_kernel(float3 rgb)
{
    float r = rgb.x, g = rgb.y, b = rgb.z;
    float max = fmaxf(fmaxf(r, g), b);
    float min = fminf(fminf(r, g), b);
    float delta = max - min;
    
    float h = (delta == 0) ? 0 : (r == max) ? (g - b) / delta : (g == max) ? 2 + (b - r) / delta : 4 + (r - g) / delta;
    h = (h < 0) ? h + 6 : h;

    float s = (max == 0) ? 0 : delta / max;
    return make_float3(h, s, max);
}

__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    if (id >= size) return;

    float r0 = rand[8*id + 0], r1 = rand[8*id + 1], r2 = rand[8*id + 2], r3 = rand[8*id + 3];
    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > .5f) ? 1.f / saturation : saturation;
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > .5f) ? 1.f / exposure : exposure;

    float rshift = rand[0], gshift = rand[1], bshift = rand[2];
    size_t offset = id * h * w * 3;
    image += offset;
    int x = id % w, y = (id / w) % h;

    float r = image[x + w * (y + h * 0)];
    float g = image[x + w * (y + h * 1)];
    float b = image[x + w * (y + h * 2)];

    float3 rgb = make_float3(r, g, b);
    if (train) {
        float3 hsv = rgb_to_hsv_kernel(rgb);
        hsv.y *= saturation;
        hsv.z *= exposure;
        rgb = hsv_to_rgb_kernel(hsv);
    } else {
        shift = 0;
    }

    image[x + w * (y + h * 0)] = rgb.x * scale + translate + (rshift - 0.5f) * shift;
    image[x + w * (y + h * 1)] = rgb.y * scale + translate + (gshift - 0.5f) * shift;
    image[x + w * (y + h * 2)] = rgb.z * scale + translate + (bshift - 0.5f) * shift;
}