#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int w = ii % d3;
    ii /= d3;
    int z = ii % d2;
    ii /= d2;
    int y = ii % d1;
    ii /= d1;
    int x = ii;
    w = w * scale_factor + off_x; // Calculate offset for w
    z = z * scale_factor + off_y; // Calculate offset for z
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w; // Compute linear index with offsets
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int w = ii % d3;
    ii /= d3;
    int z = ii % d2;
    ii /= d2;
    int y = ii % d1;
    ii /= d1;
    int x = ii;
    w = w / scale_factor; // Scale down w
    z = z / scale_factor; // Scale down z
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w; // Compute scaled down linear index
}

__device__ __forceinline__ size_t idx(const size_t nc, const size_t height, const size_t width, const size_t y, const size_t x) {
    return (nc * height + y) * width + x; // Calculate linear index
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x + threadIdx.y * blockDim.y * (blockDim.x * gridDim.x) * blockIdx.y;
    if (ii >= no_elements) return;

    // Unroll the nested loops to improve performance
#pragma unroll
    for (int i = 0; i < scale_factor; i++) {
#pragma unroll
        for (int j = 0; j < scale_factor; j++) {
            int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, i, j);
            gradInput_data[ii] += gradOutput_data[ipidx]; // Accumulate scaled-down values
        }
    }
}