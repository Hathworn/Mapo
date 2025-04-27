#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float3 hsv_to_rgb_kernel(float3 hsv)
{
    float h = hsv.x;
    float s = hsv.y;
    float v = hsv.z;

    float r, g, b;
    float f, p, q, t;

    if (s == 0) {
        r = g = b = v;
    } else {
        int index = (int)h; // Optimized: floorf removed, automatic truncation
        f = h - index;
        p = v * (1 - s);
        q = v * (1 - s * f);
        t = v * (1 - s * (1 - f));

        if (index == 0) { r = v; g = t; b = p; }
        else if (index == 1) { r = q; g = v; b = p; }
        else if (index == 2) { r = p; g = v; b = t; }
        else if (index == 3) { r = p; g = q; b = v; }
        else if (index == 4) { r = t; g = p; b = v; }
        else { r = v; g = p; b = q; }
    }

    r = fminf(fmaxf(r, 0.0f), 1.0f); // Optimized: Use fminf and fmaxf for clamping
    g = fminf(fmaxf(g, 0.0f), 1.0f);
    b = fminf(fmaxf(b, 0.0f), 1.0f);

    return make_float3(r, g, b);
}

__device__ float3 rgb_to_hsv_kernel(float3 rgb)
{
    float r = rgb.x;
    float g = rgb.y;
    float b = rgb.z;

    float h, s, v;
    float max = fmaxf(fmaxf(r, g), b); // Optimized: Use fmaxf
    float min = fminf(fminf(r, g), b); // Optimized: Use fminf
    float delta = max - min;
    v = max;

    if (max != 0.0f) {
        s = delta / max;
        if (r == max) { h = (g - b) / delta; }
        else if (g == max) { h = 2.0f + (b - r) / delta; }
        else { h = 4.0f + (r - g) / delta; }
        if (h < 0.0f) h += 6.0f;
    } else {
        s = 0.0f;
        h = -1.0f;
    }
    return make_float3(h, s, v);
}

__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Optimized: Simplified ID calculation
    int size = batch * w * h;
    if (id >= size) return;

    int x = id % w;
    int y = (id / w) % h;
    int batch_id = id / (w * h);

    float rshift = rand[0];
    float gshift = rand[1];
    float bshift = rand[2];
    float r0 = rand[8 * batch_id + 0];
    float r1 = rand[8 * batch_id + 1];
    float r2 = rand[8 * batch_id + 2];
    float r3 = rand[8 * batch_id + 3];

    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > 0.5f) ? 1.0f / saturation : saturation;
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > 0.5f) ? 1.0f / exposure : exposure;

    size_t offset = batch_id * h * w * 3;
    image += offset;
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