#include "hip/hip_runtime.h"
#include "includes.h"

__device__ unsigned char clip_rgb_gpu(int x)
{
    if(x > 255) return 255;
    if(x < 0) return 0;
    return (unsigned char)x;
}

__global__ void yuv2rgb_gpu_son(unsigned char * d_y , unsigned char * d_u ,unsigned char * d_v , unsigned char * d_r, unsigned char * d_g, unsigned char * d_b, int size)
{
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    if (x >= size) return;

    // Use local variables to reduce global memory access
    int y  = ((int)d_y[x]);
    int cb = ((int)d_u[x]) - 128;
    int cr = ((int)d_v[x]) - 128;

    // Pre-compute the common terms to optimize computation
    int cr_402 = 1.402 * cr;
    int cb_344 = 0.344 * cb;
    int cr_714 = 0.714 * cr;
    int cb_1772 = 1.772 * cb;

    int rt = y + cr_402;
    int gt = y - cb_344 - cr_714;
    int bt = y + cb_1772;

    d_r[x] = clip_rgb_gpu(rt);
    d_g[x] = clip_rgb_gpu(gt);
    d_b[x] = clip_rgb_gpu(bt);
}