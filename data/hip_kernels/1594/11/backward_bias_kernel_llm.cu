#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Unroll the loop to reduce overhead and increase efficiency
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += BLOCK*4) {
            int index0 = p + i + size*(filter + n*b);
            int index1 = index0 + BLOCK;
            int index2 = index1 + BLOCK;
            int index3 = index2 + BLOCK;
            sum += (p+i < size) ? delta[index0] : 0;
            sum += (p+i+BLOCK < size) ? delta[index1] : 0;
            sum += (p+i+BLOCK*2 < size) ? delta[index2] : 0;
            sum += (p+i+BLOCK*3 < size) ? delta[index3] : 0;
        }
    }
    part[p] = sum;
    __syncthreads();

    // Use atomic addition to avoid race conditions
    if (p == 0) {
        for (int i = 0; i < BLOCK; ++i) {
            atomicAdd(&(bias_updates[filter]), part[i]);
        }
    }
}