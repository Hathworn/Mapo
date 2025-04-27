#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Optimized index computation
    int out_w = (i % (w * stride));
    int ih = (i / (w * stride));
    int out_h = (ih % (h * stride));
    int ic = (ih / (h * stride)) % c;
    int b = (ih / (h * stride)) / c;

    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_index = b * w * h * c + ic * w * h + in_h * w + in_w;

    // Conditional handling
    if (forward) {
        out[i] += scale * x[in_index];
    } else {
        atomicAdd(&x[in_index], scale * out[i]);
    }
}