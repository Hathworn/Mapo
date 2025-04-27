#include "hip/hip_runtime.h"
#include "includes.h"

// Device function for converting HSV to RGB
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
        int index = (int)floorf(h);
        f = h - index;
        p = v * (1 - s);
        q = v * (1 - s * f);
        t = v * (1 - s * (1 - f));
        switch (index) {
            case 0: r = v; g = t; b = p; break;
            case 1: r = q; g = v; b = p; break;
            case 2: r = p; g = v; b = t; break;
            case 3: r = p; g = q; b = v; break;
            case 4: r = t; g = p; b = v; break;
            default: r = v; g = p; b = q; break;
        }
    }
    r = fminf(fmaxf(r, 0), 1);
    g = fminf(fmaxf(g, 0), 1);
    b = fminf(fmaxf(b, 0), 1);
    return make_float3(r, g, b);
}

// Device function for converting RGB to HSV
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
    if (max != 0) {
        s = delta / max;
        if (r == max) {
            h = (g - b) / delta;
        } else if (g == max) {
            h = 2 + (b - r) / delta;
        } else {
            h = 4 + (r - g) / delta;
        }
        h = (h < 0) ? h + 6 : h;
    } else {
        s = 0;
        h = -1;
    }
    return make_float3(h, s, v);
}

// Optimized CUDA kernel for image processing
__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Optimized index computation
    if (id >= size) return;

    float rshift = rand[0];
    float gshift = rand[1];
    float bshift = rand[2];
    float r0 = rand[8 * id + 0];
    float r1 = rand[8 * id + 1];
    float r2 = rand[8 * id + 2];
    float r3 = rand[8 * id + 3];

    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > .5f) ? 1.f / saturation : saturation;
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > .5f) ? 1.f / exposure : exposure;

    size_t offset = id * w * h * 3;  // Corrected offset calculation
    image += offset;
    int idx_r = id % w + w * (id / w % h);
    int idx_g = idx_r + w * h;
    int idx_b = idx_g + w * h;

    float r = image[idx_r];
    float g = image[idx_g];
    float b = image[idx_b];
    float3 rgb = make_float3(r, g, b);

    if (train) {
        float3 hsv = rgb_to_hsv_kernel(rgb);
        hsv.y *= saturation;
        hsv.z *= exposure;
        rgb = hsv_to_rgb_kernel(hsv);
    } else {
        shift = 0;
    }
    image[idx_r] = rgb.x * scale + translate + (rshift - .5f) * shift;
    image[idx_g] = rgb.y * scale + translate + (gshift - .5f) * shift;
    image[idx_b] = rgb.z * scale + translate + (bshift - .5f) * shift;
}