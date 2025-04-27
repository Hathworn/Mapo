#include "hip/hip_runtime.h"
#include "includes.h"

__device__ int translate_idx_inv(int ii, int d1, int d2, int d3, int scale_factor, int off_x, int off_y) {
    int x = ii / (d3 * d2);
    int y = (ii / d3) % d2;
    int z = (ii % d3) / scale_factor;
    int w = (off_x * scale_factor + off_y);
    z = z * scale_factor + off_y;
    d2 *= scale_factor;
    d3 *= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__device__ int translate_idx(int ii, int d1, int d2, int d3, int scale_factor) {
    int x = ii / (d3 * d2);
    int y = (ii / d3) % d2;
    int z = (ii % d3) / scale_factor;
    int w = (ii % d3) / scale_factor;
    d2 /= scale_factor;
    d3 /= scale_factor;
    return (((x * d1 + y) * d2) + z) * d3 + w;
}

__global__ void downscale(float *gradInput_data, const float *gradOutput_data, long no_elements, int scale_factor, int d1, int d2, int d3) {
    long ii = threadIdx.x + blockDim.x * blockIdx.x;
    ii += threadIdx.y + blockDim.y * (blockDim.x * gridDim.x) * blockIdx.y;
    if (ii >= no_elements) return;

    int base_idx = translate_idx(ii, d1, d2, d3, scale_factor);
    int output_idx = translate_idx_inv(base_idx, d1, d2, d3, scale_factor, 0, 0);

    // Optimize to directly fetch computed index and sum up contributions
    for (int i = 0; i < scale_factor * scale_factor; ++i) {
        gradInput_data[ii] += gradOutput_data[output_idx + i];
    }
}