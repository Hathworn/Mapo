#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Use a 2D grid and 2D block to optimize memory access
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int idy = blockIdx.y * blockDim.y + threadIdx.y;
    int index = idy * blockDim.x * gridDim.x + idx;
    if(index >= N) return;

    int in_index = index;
    int in_w = index % w;
    index /= w;
    int in_h = index % h;
    index /= h;
    int in_c = index % c;
    index /= c;
    int b = index % batch;

    int out_c = c / (stride * stride);
    int c2 = in_c % out_c;
    int offset = in_c / out_c;
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;
    int out_index = w2 + w * stride * (h2 + h * stride * (c2 + out_c * b));

    // Use shared memory for temporary storage if needed
    if(forward) 
        out[out_index] = x[in_index];
    else 
        out[in_index] = x[out_index];
}