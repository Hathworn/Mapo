#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float3 hsv_to_rgb_kernel(float3 hsv) {
    float h = hsv.x, s = hsv.y, v = hsv.z;
    float r = v, g = v, b = v;
    if (s > 0) {  // Improved readability and reduced nesting
        int index = (int)floorf(h);
        float f = h - index;
        float p = v * (1 - s);
        float q = v * (1 - s * f);
        float t = v * (1 - s * (1 - f));

        if (index == 0) { r = v; g = t; b = p; }
        else if (index == 1) { r = q; g = v; b = p; }
        else if (index == 2) { r = p; g = v; b = t; }
        else if (index == 3) { r = p; g = q; b = v; }
        else if (index == 4) { r = t; g = p; b = v; }
        else { r = v; g = p; b = q; }
    }
    // Clamp values
    r = fmaxf(0, fminf(r, 1));
    g = fmaxf(0, fminf(g, 1));
    b = fmaxf(0, fminf(b, 1));
    return make_float3(r, g, b);
}

__device__ float3 rgb_to_hsv_kernel(float3 rgb) {
    float r = rgb.x, g = rgb.y, b = rgb.z;
    float max = fmaxf(r, fmaxf(g, b)), min = fminf(r, fminf(g, b));
    float delta = max - min, h, s = (max == 0) ? 0 : delta / max, v = max;
    if (delta > 0) {
        if (r == max) { h = (g - b) / delta; }
        else if (g == max) { h = 2 + (b - r) / delta; }
        else { h = 4 + (r - g) / delta; }
        if (h < 0) h += 6;
    } else { h = -1; }
    return make_float3(h, s, v);
}

__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift) {
    int size = batch * w * h;
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= size) return;

    int x = id % w, y = (id / w) % h, idx = id / (w * h);
    float3 rgb;
    float rshift = rand[0], gshift = rand[1], bshift = rand[2];
    float r0 = rand[8 * idx + 0], r1 = rand[8 * idx + 1], r2 = rand[8 * idx + 2], r3 = rand[8 * idx + 3];

    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > 0.5f) ? 1.0f / saturation : saturation;
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > 0.5f) ? 1.0f / exposure : exposure;

    size_t offset = idx * h * w * 3;
    image += offset;
    rgb = make_float3(image[x + w * (y + h * 0)], image[x + w * (y + h * 1)], image[x + w * (y + h * 2)]);

    if (train) {
        float3 hsv = rgb_to_hsv_kernel(rgb);
        hsv.y *= saturation;
        hsv.z *= exposure;
        rgb = hsv_to_rgb_kernel(hsv);
    } else { shift = 0; }

    image[x + w * (y + h * 0)] = rgb.x * scale + translate + (rshift - 0.5f) * shift;
    image[x + w * (y + h * 1)] = rgb.y * scale + translate + (gshift - 0.5f) * shift;
    image[x + w * (y + h * 2)] = rgb.z * scale + translate + (bshift - 0.5f) * shift;
}