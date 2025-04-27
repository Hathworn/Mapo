#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Use a single loop over all elements
    for(int b = 0; b < batch; ++b){
        for(int i = threadIdx.x; i < size; i += BLOCK){
            int index = i + size*(filter + n*b);
            sum += delta[index] * x_norm[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use atomicAdd to avoid race condition 
    if (p == 0) {
        float blockSum = 0;
        for(int i = 0; i < BLOCK; ++i) {
            blockSum += part[i];
        }
        atomicAdd(&scale_updates[filter], blockSum);
    }
}