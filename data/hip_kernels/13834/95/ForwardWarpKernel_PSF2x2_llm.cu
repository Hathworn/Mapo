#include "hip/hip_runtime.h"
#include "includes.h"

__device__ __forceinline__ float imag(const float2& val) {
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst) {
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Calculate target pixel position
    float cx = u[flow_row_offset + j] * time_scale + (float)j + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + (float)i + 1.0f;

    // Decompose pixel position into integer and decimal parts
    int tx, ty;
    float dx = modff(cx, reinterpret_cast<float*>(&tx));
    float dy = modff(cy, reinterpret_cast<float*>(&ty));

    // Ensure tx, ty are within bounds
    if (tx < 0 || tx >= w || ty < 0 || ty >= h) return;

    float value = src[image_row_offset + j];

    // Use shared memory for partial pixel contributions to reduce global memory operations
    __shared__ float shared_dst[blockDim.y][blockDim.x];
    __shared__ float shared_norm[blockDim.y][blockDim.x];

    // Initialize shared memory
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        shared_dst[threadIdx.y][threadIdx.x] = 0.0f;
        shared_norm[threadIdx.y][threadIdx.x] = 0.0f;
    }
    __syncthreads();

    // Compute and accumulate weights and values for each corner
    float weight;
    weight = dx * dy;
    atomicAdd(&shared_dst[threadIdx.y][threadIdx.x], value * weight);
    atomicAdd(&shared_norm[threadIdx.y][threadIdx.x], weight);

    tx -= 1;
    weight = (1.0f - dx) * dy;
    if (tx >= 0) {
        atomicAdd(&shared_dst[threadIdx.y][threadIdx.x], value * weight);
        atomicAdd(&shared_norm[threadIdx.y][threadIdx.x], weight);
    }

    ty -= 1;
    weight = (1.0f - dx) * (1.0f - dy);
    if (tx >= 0) {
        atomicAdd(&shared_dst[threadIdx.y][threadIdx.x], value * weight);
        atomicAdd(&shared_norm[threadIdx.y][threadIdx.x], weight);
    }

    tx += 1;
    weight = dx * (1.0f - dy);
    if (tx >= 0) {
        atomicAdd(&shared_dst[threadIdx.y][threadIdx.x], value * weight);
        atomicAdd(&shared_norm[threadIdx.y][threadIdx.x], weight);
    }

    // Synchronize and writeback updates to global memory
    __syncthreads();
    
    if (threadIdx.x == 0 && threadIdx.y == 0) {
        atomicAdd(&dst[ty * image_stride + tx], shared_dst[threadIdx.y][threadIdx.x]);
        atomicAdd(&normalization_factor[ty * image_stride + tx], shared_norm[threadIdx.y][threadIdx.x]);
    }
}