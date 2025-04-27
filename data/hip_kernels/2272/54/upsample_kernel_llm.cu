#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    size_t stride_w = w * stride;
    size_t stride_h = h * stride;
    
    if (i >= N) return; // Early exit for threads outside of N

    int b = i / (stride_w * stride_h * c);
    int rem = i % (stride_w * stride_h * c);
    int out_c = rem / (stride_w * stride_h);
    rem = rem % (stride_w * stride_h);
    int out_h = rem / stride_w;
    int out_w = rem % stride_w;

    int in_w = out_w / stride; // Calculate input width
    int in_h = out_h / stride; // Calculate input height
    int in_index = b * w * h * c + out_c * w * h + in_h * w + in_w;

    if (forward) {
        out[i] += scale * x[in_index]; // Forward operation
    } else {
        atomicAdd(x + in_index, scale * out[i]); // Backward operation with atomic add
    }
}