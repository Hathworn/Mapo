#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float rgb2Lum(float B, float G, float R)
{
    return B * 0.0722 + G * 0.7152 + R * 0.2126;
}

__global__ void find_maximum_kernel(float *array, float *max, int *mutex, unsigned int n)
{
    unsigned int index = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int stride = gridDim.x * blockDim.x;
    
    extern __shared__ float cache[];

    float temp = -1.0f;
    
    // Use unrolling to improve data fetch efficiency
    while (index * 3 + 2 < n) {
        float B, G, R, L;
        B = array[index * 3 + BLUE];
        G = array[index * 3 + GREEN];
        R = array[index * 3 + RED];
        L = rgb2Lum(B, G, R);

        temp = fmaxf(temp, L);

        index += stride;
    }

    cache[threadIdx.x] = temp;
    __syncthreads();

    // Improved reduction with warp level optimizations (assumes blockDim.x is a power of 2)
    for (unsigned int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (threadIdx.x < i) {
            cache[threadIdx.x] = fmaxf(cache[threadIdx.x], cache[threadIdx.x + i]);
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        while (atomicCAS(mutex, 0, 1) != 0);  // lock
        *max = fmaxf(*max, cache[0]);
        atomicExch(mutex, 0);  // unlock
    }
}