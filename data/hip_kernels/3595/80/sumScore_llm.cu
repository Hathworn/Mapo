#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumScore(double *score, int full_size, int half_size)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;

    // Use shared memory for better performance
    extern __shared__ double sharedScore[];

    for (int i = index; i < half_size; i += stride) {
        sharedScore[threadIdx.x] = score[i];
        __syncthreads();
        
        if (i + half_size < full_size) {
            sharedScore[threadIdx.x] += score[i + half_size];
        }
        
        __syncthreads();
        score[i] = sharedScore[threadIdx.x];
    }
}