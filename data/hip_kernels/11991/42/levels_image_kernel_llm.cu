#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float3 hsv_to_rgb_kernel(float3 hsv)
{
    float h = hsv.x;
    float s = hsv.y;
    float v = hsv.z;

    float r, g, b;
    float f, p, q, t;

    // Simplified condition for when s is zero
    if (s == 0) {
        r = g = b = v;
    } else {
        int index = (int) floorf(h);
        f = h - index;
        p = v * (1 - s);
        q = v * (1 - s * f);
        t = v * (1 - s * (1 - f));
        
        // Simplified branching with a small array lookup table
        float3 rgb[6] = {
            make_float3(v, t, p), make_float3(q, v, p),
            make_float3(p, v, t), make_float3(p, q, v),
            make_float3(t, p, v), make_float3(v, p, q)
        };
        r = rgb[index].x;
        g = rgb[index].y;
        b = rgb[index].z;
    }
    // Clamp values between 0 and 1
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
        h = -1;
    } else {
        s = delta / max;
        if (r == max) {
            h = (g - b) / delta;
        } else if (g == max) {
            h = 2 + (b - r) / delta;
        } else {
            h = 4 + (r - g) / delta;
        }
        // Wrap hue to range [0,6]
        if (h < 0) h += 6;
    }
    return make_float3(h, s, v);
}

__global__ void levels_image_kernel(float *image, float *rand, int batch, int w, int h, int train, float saturation, float exposure, float translate, float scale, float shift)
{
    int size = batch * w * h;
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    // Exit early if out of bounds
    if (id >= size) return;

    int x = id % w;
    id /= w;
    int y = id % h;
    id /= h;

    // Use shared memory for random values
    __shared__ float shared_rand[3];
    if (threadIdx.x < 3) shared_rand[threadIdx.x] = rand[threadIdx.x];
    __syncthreads();

    float r0 = rand[8 * id + 0];
    float r1 = rand[8 * id + 1];
    float r2 = rand[8 * id + 2];
    float r3 = rand[8 * id + 3];

    saturation = r0 * (saturation - 1) + 1;
    saturation = (r1 > .5) ? 1. / saturation : saturation;
    exposure = r2 * (exposure - 1) + 1;
    exposure = (r3 > .5) ? 1. / exposure : exposure;

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
    } else {
        shift = 0;
    }
    // Update image with calculated values
    image[x + w * (y + h * 0)] = rgb.x * scale + translate + (shared_rand[0] - .5) * shift;
    image[x + w * (y + h * 1)] = rgb.y * scale + translate + (shared_rand[1] - .5) * shift;
    image[x + w * (y + h * 2)] = rgb.z * scale + translate + (shared_rand[2] - .5) * shift;
}