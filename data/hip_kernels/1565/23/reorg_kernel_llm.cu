```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Efficient return if out of bounds
    if(i >= N) return;

    // Use lightweight calculations to determine indices
    int in_w = i % w;
    int in_h = (i / w) % h;
    int in_c = (i / (w * h)) % c;
    int b = (i / (w * h * c)) % batch;

    int out_c = c / (stride * stride);
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    int out_index = w2 + w * stride * (h2 + h * stride * (in_c % out_c + out_c * b));

    // Direct assignment based on the 'forward' flag
    if(forward) {
        out[out_index] = x[i];
    } else {
        out[i] = x[out_index];
    }
}