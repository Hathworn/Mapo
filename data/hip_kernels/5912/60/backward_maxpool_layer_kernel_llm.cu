#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    // Calculate spatial dimensions once per thread block
    extern __shared__ int shared_mem[];
    int *sh_w = shared_mem;
    int *sh_h = sh_w + 1;

    int tx = threadIdx.x;
    if (tx == 0) {
        *sh_w = (in_w + 2 * pad) / stride;
        *sh_h = (in_h + 2 * pad) / stride;
    }
    __syncthreads();

    int c = in_c;
    int area = (size-1)/stride;

    // Calculate global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int index = id;
    int j = id % in_w;
    id /= in_w;
    int i = id % in_h;
    id /= in_h;
    int k = id % in_c;
    id /= in_c;
    int b = id;

    int w_offset = -pad;
    int h_offset = -pad;

    float d = 0.0f;

    // Consolidate valid check calculations
    #pragma unroll
    for (int l = -area; l <= area; ++l) {
        for (int m = -area; m <= area; ++m) {
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;
            bool valid = out_w >= 0 && out_h >= 0 && out_w < *sh_w && out_h < *sh_h;
            if (valid) {
                int out_index = out_w + (*sh_w) * (out_h + (*sh_h) * (k + c * b));
                if (indexes[out_index] == index) {
                    d += delta[out_index];
                }
            }
        }
    }
    prev_delta[index] += d;
}