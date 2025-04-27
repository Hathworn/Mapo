#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int i, b;
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Optimize memory access by avoiding redundant computations
    for(b = 0; b < batch; ++b){
        for(i = p; i < size; i += BLOCK){
            int index = i + size*(filter + n*b);
            sum += delta[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Optimize reduction using warp shuffle
    if (p < warpSize) {
        for (i = warpSize; i < BLOCK; i += warpSize) {
            sum += part[i + p];
        }
        bias_updates[filter] += sum;
    }
}