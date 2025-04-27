#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop to handle case where N is larger than total threads available
    for (; i < N; i += blockDim.x * gridDim.x) {
        // Calculate output indices
        int out_index = i;
        int out_w = i % (w * stride);
        i /= (w * stride);
        int out_h = i % (h * stride);
        i /= (h * stride);
        int out_c = i % c;
        i /= c;
        int b = i % batch;

        // Calculate corresponding input indices
        int in_w = out_w / stride;
        int in_h = out_h / stride;
        int in_c = out_c;

        int in_index = b * w * h * c + in_c * w * h + in_h * w + in_w;

        // Perform upsample
        if (forward) {
            out[out_index] += scale * x[in_index];
        } else {
            atomicAdd(x + in_index, scale * out[out_index]);
        }
    }
}