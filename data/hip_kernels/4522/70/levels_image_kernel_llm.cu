#include "hip/hip_runtime.h"
#include "includes.h"
__device__ float3 hsv_to_rgb_kernel(float3 hsv)
{
    float h = hsv.x;
    float s = hsv.y;
    float v = hsv.z;
    float r, g, b;

    if (s == 0) {
        r = g = b = v; // If saturation is zero, the color is gray
    } else {
        int index = (int) floorf(h);
        float f = h - index;
        float p = v * (1 - s);
        float q = v * (1 - s * f);
        float t = v * (1 - s * (1 - f));

        // Use a more optimized switch-case construct
        switch (index) {
            case 0:  r = v; g = t; b = p; break;
            case 1:  r = q; g = v; b = p; break;
            case 2:  r = p; g = v; b = t; break;
            case 3:  r = p; g = q; b = v; break;
            case 4:  r = t; g = p; b = v; break;
            default: r = v; g = p; b = q; break;
        }
    }
    return make_float3(fminf(fmaxf(r, 0.0f), 1.0f),
                       fminf(fmaxf(g, 0.0f), 1.0f),
                       fminf(fmaxf(b, 0.0f), 1.0f)); // Clamp values between 0 and 1
}

__device__ float3 rgb_to_hsv_kernel(float3 rgb)
{
    float r = rgb.x;
    float g = rgb.y;
    float b = rgb.z;

    float max = fmaxf(r, fmaxf(g, b));
    float min = fminf(r, fminf(g, b));
    float delta = max - min;

    float h, s, v = max;

    s = (max == 0) ? 0 : delta / max; // Avoid division by zero for saturation

    if (max == min) {
        h = 0; // Achromatic case
    } else if (r == max) {
        h = (g - b) / delta;
    } else if (g == max) {
        h = 2 + (b - r) / delta;
    } else {
        h = 4 + (r - g) / delta;
    }
    if (h < 0) h += 6;

    return make_float3(h, s, v);
}

__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= size) return;
    
    int x = id % w;
    int y = (id / w) % h; // Calculate y directly
    
    int imgId = id / (w * h); // Extract the image index
    size_t offset = imgId * h * w * 3; // Calculate offset using imgId

    float rshift = rand[0];
    float gshift = rand[1];
    float bshift = rand[2];
    float r0 = rand[8 * imgId + 0];
    float r1 = rand[8 * imgId + 1];
    float r2 = rand[8 * imgId + 2];
    float r3 = rand[8 * imgId + 3];

    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > .5f) ? 1.f / saturation : saturation;
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > .5f) ? 1.f / exposure : exposure;

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

    image[x + w * (y + h * 0)] = rgb.x * scale + translate + (rshift - .5f) * shift;
    image[x + w * (y + h * 1)] = rgb.y * scale + translate + (gshift - .5f) * shift;
    image[x + w * (y + h * 2)] = rgb.z * scale + translate + (bshift - .5f) * shift;
}