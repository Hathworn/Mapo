#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    size_t index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (index < N) {  // Simplified boundary check
        int out_w = index % (w * stride);
        int out_h = (index / (w * stride)) % (h * stride);
        int out_c = (index / (w * stride) / (h * stride)) % c;
        int b = index / (w * stride) / (h * stride) / c;

        int in_w = out_w / stride;
        int in_h = out_h / stride;
        int in_index = b * w * h * c + out_c * w * h + in_h * w + in_w;  // Combined redundant calculations

        if (forward) {
            out[index] += scale * x[in_index];  // Data access based on index
        } else {
            atomicAdd(&x[in_index], scale * out[index]);  // Atomic add, reduced pointer arithmetic
        }
    }
}