#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_forward_upsample_cuda_kernel(size_t dst_sz, float *src, int w, int h, int c, int n, int size, float *dst) {
    size_t i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= dst_sz) {
        return;
    }

    // Precompute common terms to reduce repetitive calculations
    int wh_size = w * size;
    int hh_size = h * size;
    int wh = w * h;
    int ch = c * wh;

    // Compute indices
    int b = i / (ch * size * size);
    int remainder = i % (ch * size * size);
    int dst_c = remainder / (wh_size * hh_size);
    remainder %= (wh_size * hh_size);
    int dst_h = remainder / wh_size;
    int dst_w = remainder % wh_size;

    // Calculate source indices
    int src_w = dst_w / size;
    int src_h = dst_h / size;
    int src_idx = b * ch + dst_c * wh + src_h * w + src_w;

    // Update destination
    dst[i] += src[src_idx];
}