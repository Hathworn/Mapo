#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float3 hsv_to_rgb_kernel(float3 hsv)
{
    float h = hsv.x;
    float s = hsv.y;
    float v = hsv.z;

    float r, g, b;
    if (s == 0) {
        r = g = b = v; // Achromatic case
    } else {
        int index = static_cast<int>(h);
        float f = h - index;
        float p = v * (1 - s);
        float q = v * (1 - s * f);
        float t = v * (1 - s * (1 - f));

        // Use a lookup table for branch elimination
        float3 cases[6] = {
            make_float3(v, t, p),
            make_float3(q, v, p),
            make_float3(p, v, t),
            make_float3(p, q, v),
            make_float3(t, p, v),
            make_float3(v, p, q)
        };
        float3 result = cases[index % 6]; // Handle wrap-around
        r = result.x;
        g = result.y;
        b = result.z;
    }

    // Clamp results between 0 and 1
    r = fminf(fmaxf(r, 0.0f), 1.0f);
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
    float max = fmaxf(r, fmaxf(g, b));
    float min = fminf(r, fminf(g, b));
    float delta = max - min;
    v = max;

    if (max == 0) {
        s = 0; 
        h = -1; // Undefined hue
    } else {
        s = delta / max;
        if (r == max) {
            h = (g - b) / delta;
        } else if (g == max) {
            h = 2 + (b - r) / delta;
        } else {
            h = 4 + (r - g) / delta;
        }
        if (h < 0) h += 6;
    }
    return make_float3(h, s, v);
}

__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = (blockDim.x * blockIdx.x) + threadIdx.x;
    if (id >= size) return;

    int pixelIndex = id % w;
    id /= w;
    int rowIndex = id % h;
    id /= h;

    float rshift = rand[0];
    float gshift = rand[1];
    float bshift = rand[2];
    float r0 = rand[8 * id + 0];
    float r1 = rand[8 * id + 1];
    float r2 = rand[8 * id + 2];
    float r3 = rand[8 * id + 3];

    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > 0.5f) ? (1.f / saturation) : saturation;
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > 0.5f) ? (1.f / exposure) : exposure;

    size_t offset = id * h * w * 3;
    image += offset;
    float r = image[pixelIndex + w * (rowIndex + h * 0)];
    float g = image[pixelIndex + w * (rowIndex + h * 1)];
    float b = image[pixelIndex + w * (rowIndex + h * 2)];
    float3 rgb = make_float3(r, g, b);

    if (train) {
        float3 hsv = rgb_to_hsv_kernel(rgb);
        hsv.y *= saturation;
        hsv.z *= exposure;
        rgb = hsv_to_rgb_kernel(hsv);
    } else {
        shift = 0;
    }

    image[pixelIndex + w * (rowIndex + h * 0)] = rgb.x * scale + translate + (rshift - 0.5f) * shift;
    image[pixelIndex + w * (rowIndex + h * 1)] = rgb.y * scale + translate + (gshift - 0.5f) * shift;
    image[pixelIndex + w * (rowIndex + h * 2)] = rgb.z * scale + translate + (bshift - 0.5f) * shift;
}