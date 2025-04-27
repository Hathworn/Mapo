#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Use a single index calculation to improve coherence
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index >= N) return; // Ensure no out-of-bounds access

    // Precompute division results to avoid redundant calculations
    int b = index / (w * h * c);
    int residual = index % (w * h * c);
    int in_c = (residual / (w * h)) % c;
    int in_h = (residual / w) % h;
    int in_w = residual % w;

    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    int out_index = b * (out_c * w * h * stride * stride) + c2 * (w * stride * h * stride) + h2 * (w * stride) + w2;

    // Use ternary operator for concise code
    out[forward ? out_index : index] = x[forward ? index : out_index];
}