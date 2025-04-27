#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK 256

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Optimize parallel accumulation across threads
    for(int b = 0; b < batch; ++b){
        for(int i = p; i < size; i += BLOCK){
            int index = i + size*(filter + n*b);
            sum += delta[index] * x_norm[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Optimize reduction using shared memory
    if (p < BLOCK/2) {
        part[p] += part[p + BLOCK/2];
    }
    __syncthreads();

    if (p < BLOCK/4) {
        part[p] += part[p + BLOCK/4];
    }
    __syncthreads();

    if (p < BLOCK/8) {
        part[p] += part[p + BLOCK/8];
    }
    __syncthreads();

    if (p < BLOCK/16) {
        part[p] += part[p + BLOCK/16];
    }
    __syncthreads();

    if (p == 0) {
        atomicAdd(&scale_updates[filter], part[0]);
    }
}