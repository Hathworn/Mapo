#include "hip/hip_runtime.h"
#include "includes.h"

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

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    // Calculate overall thread index
    long ii = blockIdx.x * blockDim.x + threadIdx.x + 
              (blockIdx.y * blockDim.y + threadIdx.y) * (blockDim.x * gridDim.x);
    
    // Early exit if index is out of bounds
    if (ii >= no_elements) return;

    // Loop unrolling for better performance
    int ipidx_base = translate_idx_inv(ii, d1, d2, d3, scale_factor, 0, 0);
    int ipidx_offset = 1;

    // Pre-fetch gradOutput_data pointer for efficiency
    const float *output_ptr = gradOutput_data + ipidx_base;

    // Accumulate the sum using loop unrolling
    #pragma unroll
    for (int i = 0; i < scale_factor; i++) {
        #pragma unroll
        for (int j = 0; j < scale_factor; j++) {
            gradInput_data[ii] += *(output_ptr + i * d3 * scale_factor + (j * ipidx_offset));
        }
    }
}