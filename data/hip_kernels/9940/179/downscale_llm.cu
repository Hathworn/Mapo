#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv( int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x = ii / (d2 * d3);
    int y = (ii / d3) % d2;
    int z = ii % d3;
    int w = ((ii / (d1 * d2 * d3)) % d1) * scale_factor + off_x;
    z = z * scale_factor + off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int x = ii / (d2 * d3);
    int y = (ii / d3) % d2;
    int z = ii % d3;
    int w = ii / (d1 * d2 * d3);
    w /= scale_factor;
    z /= scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ __forceinline__ size_t idx(const size_t nc, const size_t height, const size_t width, const size_t y, const size_t x) {
    return (nc * height + y) * width + x;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x + threadIdx.y * blockDim.y * (blockDim.x * gridDim.x) * blockIdx.y;
    if (ii >= no_elements) return;
    // Use shared memory for output accumulation to optimize memory access
    __shared__ float buffer[1024]; // Launch with thread blocks sized properly
    buffer[ii] = 0;
    for (int i = 0; i < scale_factor; ++i) {
        for (int j = 0; j < scale_factor; ++j) {
            int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, i, j);
            buffer[ii] += gradOutput_data[ipidx];
        }
    }
    gradInput_data[ii] = buffer[ii]; // Write back accumulated result 
}