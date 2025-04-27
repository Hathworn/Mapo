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
    long idx = threadIdx.x + blockDim.x * blockIdx.x;
    idx += threadIdx.y + blockDim.y * (blockDim.x * gridDim.x) * blockIdx.y;
    if (idx >= no_elements) return;

    int base_ipidx = translate_idx_inv(idx, d1, d2, d3, scale_factor, 0, 0);
    float accumulated_grad = 0.0f; // Accumulator for gradient updates

    // Use loop unrolling to reduce loop overhead
    for (int i = 0; i < scale_factor; ++i) {
        for (int j = 0; j < scale_factor; ++j) {
            int off_ipidx = translate_idx_inv(0, d1, d2, d3, scale_factor, i, j) - base_ipidx; // Offset calculation
            accumulated_grad += gradOutput_data[base_ipidx + off_ipidx];
        }
    }
    gradInput_data[idx] += accumulated_grad;
}