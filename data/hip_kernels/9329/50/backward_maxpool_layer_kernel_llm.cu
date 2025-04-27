#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_maxpool_layer_kernel(int n, int in_h, int in_w, int in_c, int stride, int size, int pad, float *delta, float *prev_delta, int *indexes)
{
    // Define shared memory per block to store temporary results for reduction
    extern __shared__ float shared_deltas[];

    int h = (in_h + 2 * pad) / stride;
    int w = (in_w + 2 * pad) / stride;
    int c = in_c;
    int area = (size - 1) / stride;

    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
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

    float d = 0;
    int l, m;

    // Load shared memory with initial zeroed values
    for (int i = threadIdx.x; i < blockDim.x; i += blockDim.x) {
        shared_deltas[i] = 0.0f;
    }
    __syncthreads();

    // Accumulate deltas into shared memory
    for (l = -area; l < area + 1; ++l) {
        for (m = -area; m < area + 1; ++m) {
            int out_w = (j - w_offset) / stride + m;
            int out_h = (i - h_offset) / stride + l;
            int out_index = out_w + w * (out_h + h * (k + c * b));
            int valid = (out_w >= 0 && out_w < w && out_h >= 0 && out_h < h);
            if (valid && indexes[out_index] == index) {
                atomicAdd(&shared_deltas[threadIdx.x], delta[out_index]);
            }
        }
    }

    __syncthreads();

    // Reduce the shared memory values back into global memory
    if (threadIdx.x == 0) {
        float block_d = 0.0f;
        for (int i = 0; i < blockDim.x; i++) {
            block_d += shared_deltas[i];
        }
        atomicAdd(&prev_delta[index], block_d);
    }
}