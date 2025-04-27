#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x; 
    int p = threadIdx.x;
    float sum = 0;

    // Improved to unroll loop over 'i' for better performance
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += BLOCK) {
            int index = p + i + size * (filter + n * b);
            sum += (p + i < size) ? delta[index] : 0;
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use reduction within shared memory to compute the final sum, instead of single thread addition
    if (p < 32) {
        for (int offset = BLOCK / 2; offset > 0; offset /= 2) {
            if (p < offset) {
                part[p] += part[p + offset];
            }
            __syncthreads();
        }
    }
    
    if (p == 0) {
        atomicAdd(&bias_updates[filter], part[0]); // Use atomic add to safely update global memory
    }
}