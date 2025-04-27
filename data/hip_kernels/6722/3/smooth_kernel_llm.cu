#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= n) return;

    int j = id % w;
    id /= w;
    int i = id % h;
    id /= h;
    int k = id % c;
    id /= c;
    int b = id;

    int out_index = j + w * (i + h * (k + c * b));
    int w_offset = -(size / 2);
    int h_offset = -(size / 2);

    // Use shared memory to optimize access
    extern __shared__ float shared_x[];
    int shared_width = size + blockDim.x;
    int shared_height = size;

    // Load data into shared memory, handle boundary conditions
    if ((i + h_offset >= 0) && (i + h_offset < h) && (j + w_offset >= 0) && (j + w_offset < w)) {
        shared_x[threadIdx.x] = x[out_index];
    }

    __syncthreads();

    int l, m;
    float sum_delta = 0.0f;

    for (l = 0; l < size; ++l) {
        for (m = 0; m < size; ++m) {
            int cur_h = h_offset + i + l;
            int cur_w = w_offset + j + m;
            int index = cur_w + w * (cur_h + h * (k + b * c));

            if ((cur_h >= 0) && (cur_h < h) && (cur_w >= 0) && (cur_w < w)) {
                sum_delta += rate * (x[index] - x[out_index]);
            }
        }
    }

    delta[out_index] += sum_delta;
}