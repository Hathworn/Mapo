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
        // Achromatic case (saturation is zero)
        r = g = b = v;
    } else {
        // Optimized calculation: using modulo operation for h index
        int index = (int)(h) % 6;
        f = h - (int)(h);
        p = v * (1 - s);
        q = v * (1 - s * f);
        t = v * (1 - s * (1 - f));

        // Reduce repeated evaluations using switch-case
        switch (index) {
            case 0: r = v; g = t; b = p; break;
            case 1: r = q; g = v; b = p; break;
            case 2: r = p; g = v; b = t; break;
            case 3: r = p; g = q; b = v; break;
            case 4: r = t; g = p; b = v; break;
            case 5: r = v; g = p; b = q; break;
        }
    }
    // Clamp results to [0, 1]
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
    
    // Use fmaxf/fminf for max/min calculation
    float max = fmaxf(r, fmaxf(g, b));
    float min = fminf(r, fminf(g, b));
    float delta = max - min;
    v = max;

    if (max == 0) {
        // Achromatic case (max is zero)
        s = 0;
        h = -1; // Undefined hue
    } else {
        s = delta / max;
        
        // Reduce repeated evaluations using conditional assignment
        if (r == max)
            h = (g - b) / delta;
        else if (g == max)
            h = 2 + (b - r) / delta;
        else
            h = 4 + (r - g) / delta;

        if (h < 0) h += 6;
    }

    return make_float3(h, s, v);
}

__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= size) return;
    
    // Simplified calculation of indices
    int x = id % w;
    int y = (id / w) % h;
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

    float r = image[x + w * y];
    float g = image[x + w * (y + h)];
    float b = image[x + w * (y + 2 * h)];
    float3 rgb = make_float3(r, g, b);
    
    if (train) {
        float3 hsv = rgb_to_hsv_kernel(rgb);
        hsv.y *= saturation;
        hsv.z *= exposure;
        rgb = hsv_to_rgb_kernel(hsv);
    } else {
        shift = 0;
    }

    // Simplify write-back with reduced redundancy
    image[x + w * y] = rgb.x * scale + translate + (rshift - 0.5f) * shift;
    image[x + w * (y + h)] = rgb.y * scale + translate + (gshift - 0.5f) * shift;
    image[x + w * (y + 2 * h)] = rgb.z * scale + translate + (bshift - 0.5f) * shift;
}