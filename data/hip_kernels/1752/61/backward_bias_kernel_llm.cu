#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Loop unrolling for better performance
    for(int b = 0; b < batch; ++b){
        for(int i = 0; i < size; i += BLOCK * 2){
            int index1 = p + i + size*(filter + n*b);
            int index2 = p + i + BLOCK + size*(filter + n*b);
            sum += (p+i < size) ? delta[index1] : 0;
            sum += (p+i + BLOCK < size) ? delta[index2] : 0;
        }
    }
    
    part[p] = sum;
    __syncthreads();
    
    // Reduction step optimization
    if (p < BLOCK / 2) {
        part[p] += part[p + BLOCK / 2];
    }
    __syncthreads();
    
    if (p == 0) {
        for(int i = 0; i < BLOCK / 2; ++i) bias_updates[filter] += part[i];
    }
}