#include "hip/hip_runtime.h"
#include "includes.h"

// Function for calculating the inverse translation index with offset and scaling
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

// Function for calculating the translation index with scaling
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

// Inline function for index calculation
__device__ __forceinline__ size_t idx(const size_t nc, const size_t height, const size_t width, const size_t y, const size_t x) {
    return (nc * height + y) * width + x;
}

// Optimized kernel function for downscaling
__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    // Calculate global thread ID
    long ii = blockIdx.y * blockDim.y * gridDim.x * blockDim.x + blockIdx.x * blockDim.x + threadIdx.y * blockDim.x + threadIdx.x;
    
    // Boundary check
    if (ii >= no_elements) return;
    
    // Loop through scale factors and update gradInput_data
    #pragma unroll  // Unroll loop for better performance
    for (int i = 0; i < scale_factor; i++) {
        for (int j = 0; j < scale_factor; j++) {
            int ipidx = translate_idx_inv(ii, d1, d2, d3, scale_factor, i, j);
            gradInput_data[ii] += gradOutput_data[ipidx];
        }
    }
}