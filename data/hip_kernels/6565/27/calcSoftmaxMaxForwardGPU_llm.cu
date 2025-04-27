#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcSoftmaxMaxForwardGPU(float *array, float *max, int *mutex, int batch_size, int in_size_x, unsigned n)
{
    unsigned int index = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int stride = gridDim.x * blockDim.x;
    
    extern __shared__ float cache[];

    float temp = -1.0;
    while (index + offset < n) {
        temp = fmaxf(temp, array[index + offset]);
        offset += stride;
    }

    cache[threadIdx.x] = temp; // Store results in shared memory by thread index
    __syncthreads();

    for (unsigned int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (threadIdx.x < i) {
            cache[threadIdx.x] = fmaxf(cache[threadIdx.x], cache[threadIdx.x + i]);
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        while (atomicCAS(mutex, 0, 1) != 0); // Lock
        max[blockIdx.x] = fmaxf(max[blockIdx.x], cache[0]); // Reduce results into global max
        atomicExch(mutex, 0); // Unlock
    }
}