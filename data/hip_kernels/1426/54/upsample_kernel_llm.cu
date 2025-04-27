#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    // Calculate the global thread index
    size_t index = blockIdx.x * blockDim.x + threadIdx.x;
    if(index >= N) return;

    // Precompute some values to avoid repeated calculations
    int w_stride = w * stride;
    int h_stride = h * stride;
    int wh = w * h;
    
    int out_w = index % w_stride;
    int out_h = (index / w_stride) % h_stride;
    int out_c = (index / (w_stride * h_stride)) % c;
    int b = index / (w_stride * h_stride * c);

    int in_w = out_w / stride;
    int in_h = out_h / stride;

    int in_index = b * wh * c + out_c * wh + in_h * w + in_w;

    // Optimized write or accumulate operations
    if(forward) {
        out[index] += scale * x[in_index];
    } else {
        atomicAdd(x + in_index, scale * out[index]);
    }
}