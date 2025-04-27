#include "hip/hip_runtime.h"
#include "includes.h"

__device__ u_char clamp(float t) {
    if (t < 0) {
        return 0;
    } else if (t > 255) {
        return 255;
    }
    return t;
}

__global__ void kernel_colorSpaceRGBAToYUV420P(dev_t *src, dev_t *dst, int pitch_src, int pitch_dst, int w, int h) {
    unsigned int dim_x = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int dim_y = blockDim.y * blockIdx.y + threadIdx.y;

    if (dim_x < w && dim_y < h) {
        // Load and unpack the RGBA value
        uint32_t rgba = *((uint32_t*)((u_char*)dst + dim_y * pitch_dst) + dim_x);
        int r = rgba >> 24;
        int g = (rgba >> 16) & 0xff;
        int b = (rgba >> 8) & 0xff;

        // Cache computed clamp values and write YUV values
        u_char y_value = clamp(0.299f * r + 0.587f * g + 0.114f * b);
        *((u_char*)((u_char*)src + dim_y * pitch_src) + dim_x) = y_value;

        // Re-use calculations and avoid repetition
        if (dim_x % 2 == 0 && dim_y % 2 == 0) {
            u_char u_value = clamp(-0.1687f * r - 0.3313f * g + 0.5f * b + 128);
            u_char v_value = clamp(0.5f * r - 0.4187f * g - 0.0813f * b + 128);
            *((u_char*)(src + (h + dim_y / 4) * pitch_src) + dim_x / 2) = u_value;
            *((u_char*)(src + (h * 5 + dim_y) / 4 * pitch_src) + dim_x / 2) = v_value;
        }
    }
}