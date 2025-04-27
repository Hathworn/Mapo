#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hardTanh_grad(float* in_x, float* in_d, float* out_d, float min_val, float max_val, int size, bool inplace) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Utilizing shared memory to reduce global memory accesses
    __shared__ float s_out_d[256]; // Assumes blockDim.x <= 256
    if (tid < size) {
        s_out_d[threadIdx.x] = out_d[tid];
    }
    __syncthreads();

    // Loop unrolling for performance
    for (int i = tid; i < size; i += stride) {
        float x = in_x[i];
        float d = in_d[i];

        if (inplace) {
            if (x < min_val || x > max_val) {
                in_d[i] = 0;
            }
        } else {
            if (x >= min_val && x <= max_val) {
                in_d[i] = d + s_out_d[threadIdx.x];
            }
        }
    }
}