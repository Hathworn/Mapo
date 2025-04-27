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

__device__ __forceinline__ size_t idx(const size_t nc, const size_t height, const size_t width, const size_t y, const size_t x) {
    return (nc * height + y) * width + x;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    // Compute the global linear index
    long ii = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x;
    
    // Check if the index is within bounds
    if (ii >= no_elements) return;

    // Local variables for accumulation
    float accum = 0.0f;

    // Precompute d multiplied by scale_factor for optimization
    int s_d2 = d2 * scale_factor;
    int s_d3 = d3 * scale_factor;

    // Unroll the loop for improved performance
    for (int i = 0; i < scale_factor; ++i) {
        for (int j = 0; j < scale_factor; ++j) {
            // Calculate input index using the inverse translation function
            int ipidx = translate_idx_inv(ii, d1, s_d2, s_d3, scale_factor, i, j);
            // Accumulate results
            accum += gradOutput_data[ipidx];
        }
    }

    // Store the accumulated value to the output
    gradInput_data[ii] = accum;
}