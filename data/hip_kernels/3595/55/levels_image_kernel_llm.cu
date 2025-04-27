#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (id >= size) return;

    int x = id % w;
    int y = (id / w) % h;
    int z = id / (w * h);

    // Pre-calculate index for accessing image array
    size_t offset = (z * h + y) * w * 3 + x;
    float r = image[offset];
    float g = image[offset + w * h];
    float b = image[offset + 2 * w * h];
    
    float rshift = rand[0];
    float gshift = rand[1];
    float bshift = rand[2];
    float r0 = rand[8 * z];
    float r1 = rand[8 * z + 1];
    float r2 = rand[8 * z + 2];
    float r3 = rand[8 * z + 3];

    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > .5f) ? 1.f / saturation : saturation;
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > .5f) ? 1.f / exposure : exposure;

    float3 rgb = make_float3(r, g, b);

    if (train) {
        float3 hsv = rgb_to_hsv_kernel(rgb);
        hsv.y *= saturation;
        hsv.z *= exposure;
        rgb = hsv_to_rgb_kernel(hsv);
    } else {
        shift = 0;
    }

    image[offset] = rgb.x * scale + translate + (rshift - 0.5f) * shift;
    image[offset + w * h] = rgb.y * scale + translate + (gshift - 0.5f) * shift;
    image[offset + 2 * w * h] = rgb.z * scale + translate + (bshift - 0.5f) * shift;
}