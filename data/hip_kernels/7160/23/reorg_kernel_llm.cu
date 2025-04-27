#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reorg_kernel(int N, float *x, int w, int h, int c, int batch, int stride, int forward, float *out)
{
    // Calculate unique global thread index
    int global_index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Check if the thread is within bounds
    if (global_index >= N) return;

    // Compute in_w, in_h, in_c, and batch b
    int temp = global_index;
    int in_w = temp % w;
    temp /= w;
    int in_h = temp % h;
    temp /= h;
    int in_c = temp % c;
    temp /= c;
    int b = temp % batch;

    // Calculate corresponding output channel and offset
    int out_c = c / (stride * stride);
    int offset = in_c / out_c;

    // Efficient w2 and h2 calculation without division
    int w2 = in_w * stride + offset % stride;
    int h2 = in_h * stride + offset / stride;

    // Calculate the output index
    int out_index = w2 + w * stride * (h2 + h * stride * (in_c % out_c + out_c * b));

    // Conditional data transfer
    if (forward) {
        out[out_index] = x[global_index];
    } else {
        out[global_index] = x[out_index];
    }
}