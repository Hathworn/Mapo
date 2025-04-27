#include "hip/hip_runtime.h"
#include "includes.h"
__device__ __forceinline__ float imag(const float2& val)
{
    return val.y;
}

__global__ void ForwardWarpKernel_PSF2x2(const float *u, const float *v, const float *src, const int w, const int h, const int flow_stride, const int image_stride, const float time_scale, float *normalization_factor, float *dst)
{
    int j = threadIdx.x + blockDim.x * blockIdx.x;
    int i = threadIdx.y + blockDim.y * blockIdx.y;

    if (i >= h || j >= w) return;

    int flow_row_offset  = i * flow_stride;
    int image_row_offset = i * image_stride;

    // Pre-compute the coordinates of the corner and the pixel shift
    float cx = u[flow_row_offset + j] * time_scale + static_cast<float>(j) + 1.0f;
    float cy = v[flow_row_offset + j] * time_scale + static_cast<float>(i) + 1.0f;

    float px, py;
    float dx = modff(cx, &px);
    float dy = modff(cy, &py);

    int tx = static_cast<int>(px);
    int ty = static_cast<int>(py);
    float value = src[image_row_offset + j];

    // Use shared bound check logic
    auto withinBounds = [w, h](int x, int y) { return !(x >= w || x < 0 || y >= h || y < 0); };

    struct {
      float wx, wy;
      int ty_adjust, tx_adjust;
    } corners[4] = {
      {dx, dy, 0, 0},            // bottom-right
      {1.0f - dx, dy, 0, -1},    // bottom-left
      {1.0f - dx, 1.0f - dy, -1, -1}, // upper-left
      {dx, 1.0f - dy, -1, 0}     // upper-right
    };

    for (const auto& corner : corners) {
        int current_tx = tx + corner.tx_adjust;
        int current_ty = ty + corner.ty_adjust;
        if (withinBounds(current_tx, current_ty)) {
            float weight = corner.wx * corner.wy;
            _atomicAdd(dst + current_ty * image_stride + current_tx, value * weight);
            _atomicAdd(normalization_factor + current_ty * image_stride + current_tx, weight);
        }
    }
}