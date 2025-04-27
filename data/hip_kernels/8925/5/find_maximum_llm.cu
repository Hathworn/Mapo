#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void find_maximum(double *array, double *max, int dSize, int *d_mutex) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;
    
    __shared__ double cache[threadsPerBlock];
    
    double temp = -DBL_MAX; // Use library constant for clarity.
    for (int i = index; i < dSize; i += stride) {
        temp = fmax(temp, array[i]);  // Simplified loop logic.
    }
    
    cache[threadIdx.x] = temp;
    __syncthreads();

    // Reduction
    for (unsigned int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (threadIdx.x < i) {
            cache[threadIdx.x] = fmax(cache[threadIdx.x], cache[threadIdx.x + i]);
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        while (atomicCAS(d_mutex, 0, 1) != 0);  // Lock
        *max = fmax(*max, cache[0]);
        atomicExch(d_mutex, 0);  // Unlock
    }
}