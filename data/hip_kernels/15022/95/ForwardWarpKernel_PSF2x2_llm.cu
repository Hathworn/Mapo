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

    // Bottom left corner of a target pixel
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Get fractional parts and integer pixel coordinates
    float px, py, dx = modff(cx, &px), dy = modff(cy, &py);
    int tx = (int)px, ty = (int)py;
    float value = src[image_row_offset + j];
    float weight;

    // Use shared memory for tile-specific weight accumulation
    __shared__ float shmem_dst[32][32]; // Adjust size based on max block size
    __shared__ float shmem_norm[32][32]; // Adjust size as needed
    shmem_dst[threadIdx.y][threadIdx.x] = 0.0f;
    shmem_norm[threadIdx.y][threadIdx.x] = 0.0f;
    __syncthreads();

    // Process target pixel and contribute to shared memory
    if (!((tx >= w) || (tx < 0) || (ty >= h) || (ty < 0))) {
        weight = dx * dy;
        atomicAdd(&shmem_dst[threadIdx.y][threadIdx.x], value * weight);
        atomicAdd(&shmem_norm[threadIdx.y][threadIdx.x], weight);
    }

    // Bottom left pixel
    tx -= 1;
    if (!((tx >= w) || (tx < 0) || (ty >= h) || (ty < 0))) {
        weight = (1.0f - dx) * dy;
        atomicAdd(&shmem_dst[threadIdx.y][threadIdx.x], value * weight);
        atomicAdd(&shmem_norm[threadIdx.y][threadIdx.x], weight);
    }

    // Upper left pixel
    ty -= 1;
    if (!((tx >= w) || (tx < 0) || (ty >= h) || (ty < 0))) {
        weight = (1.0f - dx) * (1.0f - dy);
        atomicAdd(&shmem_dst[threadIdx.y][threadIdx.x], value * weight);
        atomicAdd(&shmem_norm[threadIdx.y][threadIdx.x], weight);
    }

    // Upper right pixel
    tx += 1;
    if (!((tx >= w) || (tx < 0) || (ty >= h) || (ty < 0))) {
        weight = dx * (1.0f - dy);
        atomicAdd(&shmem_dst[threadIdx.y][threadIdx.x], value * weight);
        atomicAdd(&shmem_norm[threadIdx.y][threadIdx.x], weight);
    }
    
    __syncthreads();

    // Copy shared memory results to global memory
    if (!((tx >= w) || (tx < 0) || (ty >= h) || (ty < 0))) {
        atomicAdd(dst + ty * image_stride + tx, shmem_dst[threadIdx.y][threadIdx.x]);
        atomicAdd(normalization_factor + ty * image_stride + tx, shmem_norm[threadIdx.y][threadIdx.x]);
    }
}