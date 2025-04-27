#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float3 hsv_to_rgb_kernel(float3 hsv)
{
    float h = hsv.x;
    float s = hsv.y;
    float v = hsv.z;

    float r, g, b;
    int index = (int)floorf(h) % 6; // Normalize h to [0, 6)
    float f = h - index;
    float p = v * (1 - s);
    float q = v * (1 - s * f);
    float t = v * (1 - s * (1 - f));

    // Assign r, g, b based on the index
    r = (index == 0) ? v : (index == 1) ? q : (index == 2) ? p : (index == 3) ? p : (index == 4) ? t : v;
    g = (index == 0) ? t : (index == 1) ? v : (index == 2) ? v : (index == 3) ? q : (index == 4) ? p : p;
    b = (index == 0) ? p : (index == 1) ? p : (index == 2) ? t : (index == 3) ? v : (index == 4) ? v : q;

    return make_float3(fminf(fmaxf(r, 0.0f), 1.0f), fminf(fmaxf(g, 0.0f), 1.0f), fminf(fmaxf(b, 0.0f), 1.0f));
}

__device__ float3 rgb_to_hsv_kernel(float3 rgb)
{
    float r = rgb.x;
    float g = rgb.y;
    float b = rgb.z;

    float max = fmaxf(r, fmaxf(g, b));
    float min = fminf(r, fminf(g, b));
    float delta = max - min;
    float h = 0, s = (max != 0) ? (delta / max) : 0, v = max;

    if (delta != 0) {
        if (r == max) h = (g - b) / delta + (g < b ? 6.0f : 0.0f);
        else if (g == max) h = (b - r) / delta + 2.0f;
        else if (b == max) h = (r - g) / delta + 4.0f;
        h /= 6.0f; // Normalize h to [0, 1)
    } else {
        h = 0; // h is undefined when s is 0
    }

    return make_float3(h, s, v);
}

__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size) return;

    int x = id % w;
    id /= w;
    int y = id % h;
    id /= h;

    float rshift = rand[0];
    float gshift = rand[1];
    float bshift = rand[2];
    float r0 = rand[8 * id + 0];
    float r1 = rand[8 * id + 1];
    float r2 = rand[8 * id + 2];
    float r3 = rand[8 * id + 3];

    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > 0.5f) ? 1.0f / saturation : saturation;
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > 0.5f) ? 1.0f / exposure : exposure;

    size_t offset = id * h * w * 3;
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
    }

    image[x + w * (y + h * 0)] = rgb.x * scale + translate + (rshift - 0.5f) * shift;
    image[x + w * (y + h * 1)] = rgb.y * scale + translate + (gshift - 0.5f) * shift;
    image[x + w * (y + h * 2)] = rgb.z * scale + translate + (bshift - 0.5f) * shift;
}