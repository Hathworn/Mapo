#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Unrolling batch loop for performance
    for(int b = 0; b < batch; ++b) {
        // Unrolling inner loop for performance
        for(int i = 0; i < size; i += BLOCK*2) {
            int index1 = p + i + size*(filter + n*b);
            int index2 = index1 + BLOCK;
            sum += (p+i < size) ? delta[index1] : 0;
            sum += (p+i+BLOCK < size) ? delta[index2] : 0;
        }
    }
    part[p] = sum;
    __syncthreads();

    // Efficient reduction using loop unrolling and warp aggregation
    if (p < 32) {
        for(int i = 32; i < BLOCK; i += 32) {
            part[p] += part[p + i];
        }
    }
    __syncthreads();
    
    if (p == 0) {
        for(int i = 0; i < 32; ++i) {
            bias_updates[filter] += part[i];
        }
    }
}