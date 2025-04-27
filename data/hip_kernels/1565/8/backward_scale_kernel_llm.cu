#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK 1024

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Unroll loop for improved performance
    for(int b = 0; b < batch; ++b){
        for(int i = 0; i < size; i += BLOCK){
            int index = p + i + size * (filter + n * b);
            if ((p + i) < size) {
                sum += delta[index] * x_norm[index];
            }
        }
    }
    part[p] = sum;
    __syncthreads();

    // Use atomicAdd for thread-safe accumulation
    if (p == 0) {
        for(int i = 0; i < BLOCK; ++i) {
            atomicAdd(&scale_updates[filter], part[i]);
        }
    }
}