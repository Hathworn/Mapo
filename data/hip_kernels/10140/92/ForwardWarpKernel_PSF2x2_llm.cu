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

    // Calculate the fractional and integer position
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);

    float value = src[image_row_offset + j];
    float weight;

    // Shared memory for atomic operations (Optional for further optimization)
    extern __shared__ float shared_memory[];
    float *shared_dst = shared_memory;
    float *shared_norm = shared_memory + blockDim.x * blockDim.y;

    // Fill pixel containing bottom right corner
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        weight = dx * dy;
        atomicAdd(&shared_dst[ty * image_stride + tx], value * weight);
        atomicAdd(&shared_norm[ty * image_stride + tx], weight);
    }

    // Fill pixel containing bottom left corner
    tx -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        weight = (1.0f - dx) * dy;
        atomicAdd(&shared_dst[ty * image_stride + tx], value * weight);
        atomicAdd(&shared_norm[ty * image_stride + tx], weight);
    }

    // Fill pixel containing upper left corner
    ty -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        weight = (1.0f - dx) * (1.0f - dy);
        atomicAdd(&shared_dst[ty * image_stride + tx], value * weight);
        atomicAdd(&shared_norm[ty * image_stride + tx], weight);
    }

    // Fill pixel containing upper right corner
    tx += 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h)
    {
        weight = dx * (1.0f - dy);
        atomicAdd(&shared_dst[ty * image_stride + tx], value * weight);
        atomicAdd(&shared_norm[ty * image_stride + tx], weight);
    }

    // Write back to global memory
    __syncthreads();
    if (threadIdx.x < blockDim.x && threadIdx.y < blockDim.y) 
    {
        int global_index = (blockIdx.y * blockDim.y + threadIdx.y) * image_stride 
                           + (blockIdx.x * blockDim.x + threadIdx.x);
        if (global_index < w * h)
        {
            atomicAdd(&dst[global_index], shared_dst[threadIdx.y * blockDim.x + threadIdx.x]);
            atomicAdd(&normalization_factor[global_index], shared_norm[threadIdx.y * blockDim.x + threadIdx.x]);
        }
    }
}