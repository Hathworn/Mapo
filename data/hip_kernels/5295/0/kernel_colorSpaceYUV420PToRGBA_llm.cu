#include "hip/hip_runtime.h"
#include "includes.h"

__device__ u_char clamp(float t)
{
    if (t < 0) {
        return 0;
    } else if (t > 255) {
        return 255;
    }
    return t;
}

__global__ void kernel_colorSpaceYUV420PToRGBA(dev_t *src, dev_t *dst, int pitch_src, int pitch_dst, int w, int h)
{
    // Calculate global thread positions
    unsigned int dim_x = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int dim_y = blockDim.y * blockIdx.y + threadIdx.y;

    if (dim_x < w && dim_y < h) {
        // Consolidate and simplify memory access
        u_char *src_ptr = (u_char*)src;
        int y_index = dim_y * pitch_src + dim_x;
        int uv_offset = h * pitch_src;
        int u_index = (h + dim_y / 4) * pitch_src + dim_x / 2;
        int v_index = (h * 5 + dim_y) / 4 * pitch_src + dim_x / 2;

        int y = src_ptr[y_index];
        int u = src_ptr[u_index];
        int v = src_ptr[v_index];

        // Compute RGB values using simplified arithmetic
        int r = clamp(y + 1.402f * (v - 128) + 0.5f);
        int g = clamp(y - 0.34414f * (u - 128) - 0.71414f * (v - 128) + 0.5f);
        int b = clamp(y + 1.772f * (u - 128) + 0.5f);

        // Optimize memory writes by grouping writes together
        u_char *dst_ptr = (u_char*)dst;
        int dst_index = dim_y * pitch_dst + dim_x * 4;
        dst_ptr[dst_index] = r;
        dst_ptr[dst_index + 1] = g;
        dst_ptr[dst_index + 2] = b;
        dst_ptr[dst_index + 3] = 255;  // Alpha channel set to max
    }
}