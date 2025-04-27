#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x, y, z, w;
    w = ii % d3;
    ii = ii/d3;
    z = ii % d2;
    ii = ii/d2;
    y = ii % d1;
    ii = ii/d1;
    x = ii;
    w = w*scale_factor + off_x;
    z = z*scale_factor + off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x*d1 + y) * d2) + z) * d3 + w;
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int x, y, z, w;
    w = ii % d3;
    ii = ii/d3;
    z = ii % d2;
    ii = ii/d2;
    y = ii % d1;
    ii = ii/d1;
    x = ii;
    w /= scale_factor;
    z /= scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x*d1 + y) * d2) + z) * d3 + w;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x;
    ii += threadIdx.y + blockDim.y * (blockDim.x * gridDim.x) * blockIdx.y;
    if (ii >= no_elements) return;

    // Use registers for repetitive computations
    int sf = scale_factor * scale_factor; // Pre-calculate scale factor squared
    float gradInput_val = gradInput_data[ii]; // Cache current value for the current index

    int base_idx = translate_idx_inv(ii, d1, d2, d3, scale_factor, 0, 0); // Base index for offset calculations, more efficient

    for (int i = 0; i < sf; i++) { // Use direct computation instead of nested loops
        int ipidx = base_idx + (i % scale_factor) + (i / scale_factor) * d3; // Offset calculation simplified
        gradInput_val += gradOutput_data[ipidx]; // Accumulate result
    }

    gradInput_data[ii] = gradInput_val; // Store the accumulated result
}