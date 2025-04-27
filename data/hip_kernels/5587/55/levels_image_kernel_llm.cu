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
        int index = (int) floorf(h * 6.0f); // Normalize h to 0-6 range
        f = h * 6.0f - index; // Updated fractional part of h
        p = v * (1.0f - s);
        q = v * (1.0f - s * f);
        t = v * (1.0f - s * (1.0f - f));

        switch (index % 6) { // Use modulus for cyclic indexing
            case 0: r = v; g = t; b = p; break;
            case 1: r = q; g = v; b = p; break;
            case 2: r = p; g = v; b = t; break;
            case 3: r = p; g = q; b = v; break;
            case 4: r = t; g = p; b = v; break;
            default: r = v; g = p; b = q; break;
        }
    }
    return make_float3(fmaxf(0.0f, fminf(1.0f, r)), 
                       fmaxf(0.0f, fminf(1.0f, g)), 
                       fmaxf(0.0f, fminf(1.0f, b)));
}

__device__ float3 rgb_to_hsv_kernel(float3 rgb)
{
    float r = rgb.x;
    float g = rgb.y;
    float b = rgb.z;

    float h, s, v;
    float max = fmaxf(fmaxf(r, g), b);
    float min = fminf(fminf(r, g), b);
    float delta = max - min;
    v = max;
    
    if(max == 0){
        s = 0;
        h = -1;
    } else {
        s = delta / max;
        if(r == max) h = (g - b) / delta;
        else if(g == max) h = 2.0f + (b - r) / delta;
        else h = 4.0f + (r - g) / delta;
        h /= 6.0f; // Normalize h to 0-1 range
        if (h < 0) h += 1.0f;
    }

    return make_float3(h, s, v);
}

__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if(id >= size) return;

    // Precompute offsets and index conversions
    int x = id % w;
    int y = id / w % h;
    int batchIndex = id / (w * h);

    float rshift = rand[0];
    float gshift = rand[1];
    float bshift = rand[2];
    float r0 = rand[8 * batchIndex];
    float r1 = rand[8 * batchIndex + 1];
    float r2 = rand[8 * batchIndex + 2];
    float r3 = rand[8 * batchIndex + 3];

    saturation = r0 * (saturation - 1.0f) + 1.0f;
    saturation = (r1 > 0.5f) ? 1.0f / saturation : saturation;
    exposure = r2 * (exposure - 1.0f) + 1.0f;
    exposure = (r3 > 0.5f) ? 1.0f / exposure : exposure;

    size_t offset = batchIndex * h * w * 3;
    image += offset;

    float r = image[x + w * (y + h * 0)];
    float g = image[x + w * (y + h * 1)];
    float b = image[x + w * (y + h * 2)];
    float3 rgb = make_float3(r, g, b);

    if(train) {
        float3 hsv = rgb_to_hsv_kernel(rgb);
        hsv.y *= saturation;
        hsv.z *= exposure;
        rgb = hsv_to_rgb_kernel(hsv);
    } else {
        shift = 0;
    }

    // Scale and shift RGB values
    image[x + w * (y + h * 0)] = rgb.x * scale + translate + (rshift - 0.5f) * shift;
    image[x + w * (y + h * 1)] = rgb.y * scale + translate + (gshift - 0.5f) * shift;
    image[x + w * (y + h * 2)] = rgb.z * scale + translate + (bshift - 0.5f) * shift;
}