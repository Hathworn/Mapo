#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Use thread_stride and loop unrolling for performance improvement
    int thread_stride = blockDim.x;
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += thread_stride * BLOCK) {
            int index_base = size * (filter + n * b) + i;
            #pragma unroll 4
            for (int j = 0; j < BLOCK; j += thread_stride) {
                int index = p + j + index_base;
                if (p + j < size) {
                    sum += delta[index] * x_norm[index];
                }
            }
        }
    }
    part[p] = sum;
    __syncthreads();

    // Using atomicAdd to reduce contention
    if (p == 0) {
        float block_sum = 0;
        for (int i = 0; i < BLOCK; ++i) {
            block_sum += part[i];
        }
        atomicAdd(&scale_updates[filter], block_sum);
    }
}