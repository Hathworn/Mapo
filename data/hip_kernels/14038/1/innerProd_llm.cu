#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void innerProd(float *aa, float *bb, float *cc)
{
    __shared__ float temp[THREADS_PER_BLOCK];
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Load data into shared memory
    float value = aa[index] * bb[index];
    temp[threadIdx.x] = value;
    
    __syncthreads();

    // Sum reduction within the block
    if (threadIdx.x == 0) {
        float sum = 0;
        for (int i = 0; i < THREADS_PER_BLOCK; i++) {
            sum += temp[i];
        }
        // Use atomicAdd to update global output safely
        atomicAdd(cc, sum);
    }
}