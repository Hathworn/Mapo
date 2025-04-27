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

    // Cache values in shared memory to reduce redundant memory access
    float cx = u[flow_row_offset + j] * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + static_cast<float>(i) + 1.0f;
   
    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);
    
    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);
    float value = src[image_row_offset + j];
    float weight;

    // Utilize shared memory for storing partial sums to reduce memory contention
    __shared__ float sharedDst[1024]; // Assuming block size fits within 1024 shared memory
    __shared__ float sharedNorm[1024];
    int sharedOffset = threadIdx.y * blockDim.x + threadIdx.x;
    sharedDst[sharedOffset] = 0;
    sharedNorm[sharedOffset] = 0;
    __syncthreads();

    // Process all four possible target pixels
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = dx * dy;
        atomicAdd(&sharedDst[sharedOffset], value * weight);
        atomicAdd(&sharedNorm[sharedOffset], weight);
    }

    tx -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = (1.0f - dx) * dy;
        atomicAdd(&sharedDst[sharedOffset], value * weight);
        atomicAdd(&sharedNorm[sharedOffset], weight);
    }

    ty -= 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = (1.0f - dx) * (1.0f - dy);
        atomicAdd(&sharedDst[sharedOffset], value * weight);
        atomicAdd(&sharedNorm[sharedOffset], weight);
    }

    tx += 1;
    if (tx >= 0 && tx < w && ty >= 0 && ty < h) {
        weight = dx * (1.0f - dy);
        atomicAdd(&sharedDst[sharedOffset], value * weight);
        atomicAdd(&sharedNorm[sharedOffset], weight);
    }

    // Write back accumulated results from shared memory to global memory
    __syncthreads();
    if (sharedDst[sharedOffset] != 0) {
        atomicAdd(&dst[ty * image_stride + tx], sharedDst[sharedOffset]);
    }
    if (sharedNorm[sharedOffset] != 0) {
        atomicAdd(&normalization_factor[ty * image_stride + tx], sharedNorm[sharedOffset]);
    }
}