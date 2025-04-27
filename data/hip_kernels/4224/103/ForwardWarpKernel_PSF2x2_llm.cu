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

    // Precompute commonly used indices
    int flow_row_offset  = i * flow_stride + j;
    int image_row_offset = i * image_stride + j;

    // Compute warped position
    float cx = u[flow_row_offset] * time_scale + j + 1.0f;
    float cy = v[flow_row_offset] * time_scale + i + 1.0f;

    // Decompose into integer and fractional parts
    float px, py, dx = modff(cx, &px), dy = modff(cy, &py);

    // Integer target pixel coords
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);

    // Fetch source value once
    float value = src[image_row_offset];

    // Consolidate the four possible updates into a loop to enhance readability and maintainability
    #pragma unroll
    for (int corner = 0; corner < 4; ++corner) 
    {
        int offset_x = (corner & 1) ? 0 : -1;
        int offset_y = (corner & 2) ? 0 : -1;
        float weight_x = (corner & 1) ? dx : (1.0f - dx);
        float weight_y = (corner & 2) ? dy : (1.0f - dy);
        int final_tx = tx + offset_x;
        int final_ty = ty + offset_y;
        
        if (!(final_tx >= w || final_tx < 0 || final_ty >= h || final_ty < 0)) {
            float weight = weight_x * weight_y;
            atomicAdd(dst + final_ty * image_stride + final_tx, value * weight);
            atomicAdd(normalization_factor + final_ty * image_stride + final_tx, weight);
        }
    }
}