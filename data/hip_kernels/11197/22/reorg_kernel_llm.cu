#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate the global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if(index >= N) return;

    // Calculate indices based on flattened index
    int b = index / (w * h * c);
    int in_c = (index / (w * h)) % c;
    int in_h = (index / w) % h;
    int in_w = index % w;

    // Calculate the output coordinates
    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    int out_index = b * out_c * h * stride * w * stride + c2 * h * stride * w * stride + h2 * w * stride + w2;

    // Perform the reorganization
    if(forward) 
        out[out_index] = x[index];
    else 
        out[index] = x[out_index];
}