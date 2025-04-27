#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK 256 // Assumed BLOCK size, usually better defined globally

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;

    // Reduce `part` array initialization and accumulation
    float sum = 0.0f;

    // Unrolling loop for better performance
    for(int b = 0; b < batch; ++b){
        for(int i = 0; i < size; i += BLOCK){
            int index = p + i + size * (filter + n * b);
            if (p + i < size) {
                sum += delta[index];
            }
        }
    }

    // Use warp reduction for shared memory accumulation
    part[p] = sum;
    __syncthreads();

    // Optimized reduction with warp
    if (p < 32) { 
        for(int i = p + 32; i < BLOCK; i += 32) {
            sum += part[i];
        }
    }

    // Final bias update with atomic operation
    if (p == 0) {
        atomicAdd(&bias_updates[filter], sum);
    }
}