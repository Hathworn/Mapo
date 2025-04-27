#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // bottom left corner of a target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    // pixel containing bottom left corner
    float px;
    float py;
    float dx = modff (cx, &px);
    float dy = modff (cy, &py);
    // target pixel integer coords
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);
    float value = src[image_row_offset + j];

    #pragma unroll // Unroll the loop to eliminate branches
    for (int k = 0; k < 4; ++k)
    {
        float weight;
        // Define shifts in box coordinates
        int shift_x = (k == 1 || k == 2) ? -1 : 0;
        int shift_y = (k == 2 || k == 3) ? -1 : 0;

        // Update tx and ty accordingly
        int tmp_tx = tx + shift_x;
        int tmp_ty = ty + shift_y;

        if (!(tmp_tx >= w || tmp_tx < 0 || tmp_ty >= h || tmp_ty < 0))
        {
            // Calculate weight based on corner
            switch (k)
            {
                case 0: weight = dx * dy; break;            // bottom right
                case 1: weight = (1.0f - dx) * dy; break;   // bottom left
                case 2: weight = (1.0f - dx) * (1.0f - dy); break; // upper left
                case 3: weight = dx * (1.0f - dy); break;   // upper right
            }

            atomicAdd(dst + tmp_ty * image_stride + tmp_tx, value * weight);
            atomicAdd(normalization_factor + tmp_ty * image_stride + tmp_tx, weight);
        }
    }
}