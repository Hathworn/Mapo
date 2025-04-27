#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize HSV to RGB conversion kernel
__device__ float3 hsv_to_rgb_kernel(float3 hsv)
{
    const float h = hsv.x, s = hsv.y, v = hsv.z;
    if (s == 0) return make_float3(v, v, v);
    
    const int index = (int)floorf(h);
    const float f = h - index;
    const float p = v * (1 - s);
    const float q = v * (1 - s * f);
    const float t = v * (1 - s * (1 - f));

    if (index == 0) return make_float3(v, t, p);
    if (index == 1) return make_float3(q, v, p);
    if (index == 2) return make_float3(p, v, t);
    if (index == 3) return make_float3(p, q, v);
    if (index == 4) return make_float3(t, p, v);
    return make_float3(v, p, q);
}

// Optimize RGB to HSV conversion kernel
__device__ float3 rgb_to_hsv_kernel(float3 rgb)
{
    const float r = rgb.x, g = rgb.y, b = rgb.z;
    const float max = fmaxf(fmaxf(r, g), b);
    const float min = fminf(fminf(r, g), b);
    const float delta = max - min;
    float h = -1, s = max == 0 ? 0 : delta / max, v = max;

    if (delta != 0) {
        if (r == max) h = (g - b) / delta;
        else if (g == max) h = 2 + (b - r) / delta;
        else h = 4 + (r - g) / delta;
        if (h < 0) h += 6;
    }
    return make_float3(h, s, v);
}

// Optimize global kernel function
__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return;
   
    float rshift = rand[0], gshift = rand[1], bshift = rand[2];
    float r0 = rand[8 * id + 0], r1 = rand[8 * id + 1], r2 = rand[8 * id + 2], r3 = rand[8 * id + 3];
    
    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > .5f) ? 1.f / saturation : saturation;
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > .5f) ? 1.f / exposure : exposure;

    size_t offset = id * h * w * 3;
    float r = image[offset + w * (0 * h)], g = image[offset + w * (1 * h)], b = image[offset + w * (2 * h)];
    float3 rgb = make_float3(r, g, b);

    if (train) {
        float3 hsv = rgb_to_hsv_kernel(rgb);
        hsv.y *= saturation;
        hsv.z *= exposure;
        rgb = hsv_to_rgb_kernel(hsv);
    } else {
        shift = 0;
    }

    image[offset + w * (0 * h)] = rgb.x * scale + translate + (rshift - .5f) * shift;
    image[offset + w * (1 * h)] = rgb.y * scale + translate + (gshift - .5f) * shift;
    image[offset + w * (2 * h)] = rgb.z * scale + translate + (bshift - .5f) * shift;
}