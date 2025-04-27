#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Compute the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= N) return;

    // Reduce frequency of the expensive integer division and modulus operations
    int in_index = idx;
    int in_w = in_index % w;
    int in_h = (in_index / w) % h;
    int in_c = (in_index / (w * h)) % c;
    int b = (in_index / (w * h * c)) % batch;

    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Use ternary operator for branchless conditional assignment
    out[forward ? out_index : in_index] = x[forward ? in_index : out_index];
}