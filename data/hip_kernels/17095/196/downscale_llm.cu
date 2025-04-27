```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimization of translate_idx_inv function
__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x, y, z, w;
    w = ii % d3; 
    ii = ii / d3;
    z = ii % d2; 
    ii = ii / d2;
    y = ii % d1; 
    ii = ii / d1;
    x = ii;
    
    w = w * scale_factor + off_x;
    z = z * scale_factor + off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

// Optimization of translate_idx function
__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int x, y, z, w;
    w = ii % d3; 
    ii = ii / d3;
    z = ii % d2; 
    ii = ii / d2;
    y = ii % d1; 
    ii = ii / d1;
    x = ii;
    
    w = w / scale_factor;
    z = z / scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ __forceinline__ size_t idx(const size_t nc, const size_t height, const size_t width, const size_t y, const size_t x) {
    return (nc * height + y) * width + x;
}

// Kernel function optimization
__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * (blockDim.x * gridDim.x);
    if (ii >= no_elements) 
        return;

    int ipidx_base = translate_idx_inv(ii, d1, d2, d3, scale_factor, 0, 0);
    for (int i = 0; i < scale_factor; i++) {
        for (int j = 0; j < scale_factor; j++) {
            // Reduce function calls by calculating base index once
            int ipidx = ipidx_base + i * d3 * scale_factor + j;
            gradInput_data[ii] += gradOutput_data[ipidx];
        }
    }
}