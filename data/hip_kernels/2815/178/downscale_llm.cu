#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x, y, z, w;
    w = ii % d3;
    ii /= d3;
    z = ii % d2;
    ii /= d2;
    y = ii % d1;
    ii /= d1;
    x = ii;
    w = w * scale_factor + off_x;
    z = z * scale_factor + off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int x, y, z, w;
    w = ii % d3;
    ii /= d3;
    z = ii % d2;
    ii /= d2;
    y = ii % d1;
    ii /= d1;
    x = ii;
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
    // Calculate unique global index for each thread
    long ii = threadIdx.x + blockDim.x * blockIdx.x + 
              (threadIdx.y + blockDim.y * blockIdx.y) * (blockDim.x * gridDim.x);
    
    // Exit if index exceeds number of elements
    if (ii >= no_elements) return;
    
    int baseIpIdx = translate_idx_inv(ii, d1, d2, d3, scale_factor, 0, 0);
    
    // Unroll loops to exploit compiler optimizations
    float sum = 0.0f;
    for (int i = 0; i < scale_factor; i++) {
        for (int j = 0; j < scale_factor; j++) {
            int ipidx = baseIpIdx + j * d3 + i * d3 * d2;
            sum += gradOutput_data[ipidx];
        }
    }
    
    // Atomic add to prevent race condition
    atomicAdd(&gradInput_data[ii], sum);
}