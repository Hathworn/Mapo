#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Pre-compute values to reduce repetitive arithmetic operations
    int area = w * h;
    int slice = area * c;
    int out_area = w * stride * h * stride;

    // Extract input dimensions
    int b = i / slice;
    int remainder = i % slice;
    int in_c = remainder / area;
    remainder = remainder % area;
    int in_h = remainder / w;
    int in_w = remainder % w;

    // Compute output dimensions
    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    
    // Calculate the output index
    int b_stride = b * out_area * out_c;
    int out_index = w2 + w * stride * (h2 + h * stride * c2) + b_stride;

    // Write output based on the forward flag
    if (forward)
        out[out_index] = x[in_index];
    else
        out[in_index] = x[out_index];
}