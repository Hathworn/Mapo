#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float3 hsv_to_rgb_kernel(float3 hsv) {
    float h = hsv.x, s = hsv.y, v = hsv.z;
    float r, g, b, f, p, q, t;
    int index = static_cast<int>(floorf(h));
    
    f = h - index;
    p = v * (1 - s);
    q = v * (1 - s * f);
    t = v * (1 - s * (1 - f));

    // Use a switch statement for clearer and potentially more efficient branching
    switch (index) {
        case 0: r = v; g = t; b = p; break;
        case 1: r = q; g = v; b = p; break;
        case 2: r = p; g = v; b = t; break;
        case 3: r = p; g = q; b = v; break;
        case 4: r = t; g = p; b = v; break;
        default: r = v; g = p; b = q; break;
    }

    // Clamp the values to [0,1]
    r = fminf(fmaxf(r, 0.0f), 1.0f);
    g = fminf(fmaxf(g, 0.0f), 1.0f);
    b = fminf(fmaxf(b, 0.0f), 1.0f);

    return make_float3(r, g, b);
}

__device__ float3 rgb_to_hsv_kernel(float3 rgb) {
    float r = rgb.x, g = rgb.y, b = rgb.z;
    float h, s, v, max, min, delta;

    max = fmaxf(fmaxf(r, g), b);
    min = fminf(fminf(r, g), b);
    delta = max - min;
    v = max;

    if (max != 0) {
        s = delta / max;
        if (r == max) {
            h = (g - b) / delta;
        } else if (g == max) {
            h = 2 + (b - r) / delta;
        } else {
            h = 4 + (r - g) / delta;
        }
        if (h < 0) h += 6;
    } else {
        s = 0;
        h = -1;
    }

    return make_float3(h, s, v);
}

__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift) {
    int size = batch * w * h;
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    if (id >= size) return;
    
    int x = id % w;
    int y = (id / w) % h;
    int b = id / (w * h);

    // Pre-calculate values that are reused
    float rshift = rand[0], gshift = rand[1], bshift = rand[2];
    float r0 = rand[8 * b + 0], r1 = rand[8 * b + 1];
    float r2 = rand[8 * b + 2], r3 = rand[8 * b + 3];

    saturation = (r0 * (saturation - 1) + 1);
    if (r1 > 0.5f) saturation = 1.0f / saturation;
    
    exposure = (r2 * (exposure - 1) + 1);
    if (r3 > 0.5f) exposure = 1.0f / exposure;

    size_t offset = (b * h + y) * w + x;
    float r = image[offset];
    float g = image[offset + w];
    float b = image[offset + 2 * w];
    float3 rgb = make_float3(r, g, b);

    if (train) {
        float3 hsv = rgb_to_hsv_kernel(rgb);
        hsv.y *= saturation;
        hsv.z *= exposure;
        rgb = hsv_to_rgb_kernel(hsv);
    } else {
        shift = 0.0f;
    }
    
    image[offset] = fmaf(rgb.x, scale, translate + (rshift - .5f) * shift);
    image[offset + w] = fmaf(rgb.y, scale, translate + (gshift - .5f) * shift);
    image[offset + 2 * w] = fmaf(rgb.z, scale, translate + (bshift - .5f) * shift);
}