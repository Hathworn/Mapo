#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void upsample_kernel(size_t N, float *x, int w, int h, int c, int batch, int stride, int forward, float scale, float *out)
{
    // Calculate global thread index
    size_t i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Precompute reused values to reduce operations
    int wh_stride = w * stride;
    int hc = h * c;

    int out_w = i % wh_stride;
    int out_h = (i / wh_stride) % (h * stride);
    int out_c = (i / (wh_stride * h * stride)) % c;
    int b = i / (wh_stride * hc);
    
    int in_w = out_w / stride;
    int in_h = out_h / stride;
    int in_c = out_c;

    int in_index = b * w * h * c + in_c * w * h + in_h * w + in_w;

    // Use ternary operator for clarity
    float result = scale * (forward ? x[in_index] : out[out_index]);
    if (forward) {
        out[out_index] += result;  // Calculate forward output
    } else {
        atomicAdd(x + in_index, result);  // Update input using atomicAdd
    }
}