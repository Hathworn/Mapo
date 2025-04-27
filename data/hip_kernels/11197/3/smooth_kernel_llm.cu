#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void smooth_kernel(float *x, int n, int w, int h, int c, int size, float rate, float *delta)
{
    int id = blockIdx.z * (gridDim.y * gridDim.x * blockDim.x) + blockIdx.y * (gridDim.x * blockDim.x) + blockIdx.x * blockDim.x + threadIdx.x;
    if(id >= n) return;

    int j = id % w;
    id /= w;
    int i = id % h;
    id /= h;
    int k = id % c;
    id /= c;
    int b = id;

    int w_offset = -(size / 2);
    int h_offset = -(size / 2);

    int out_index = j + w * (i + h * (k + c * b));
    float local_delta = 0.0f; // Accumulate delta locally to reduce memory access
    for(int l = 0; l < size; ++l) {
        for(int m = 0; m < size; ++m) {
            int cur_h = h_offset + i + l;
            int cur_w = w_offset + j + m;
            int index = cur_w + w * (cur_h + h * (k + b * c));
            if (cur_h >= 0 && cur_h < h && cur_w >= 0 && cur_w < w) {
                 local_delta += rate * (x[index] - x[out_index]); // Use local_delta
            }
        }
    }
    atomicAdd(&delta[out_index], local_delta); // Atomic update to prevent race condition
}