#include "hip/hip_runtime.h"
#include "includes.h"

const int THREADS_PER_BLOCK = 32;
const int N = 2048;

__global__ void dotProd( int *a, int *b, int *c ) {
    __shared__ int temp[THREADS_PER_BLOCK];
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure within bounds
    if (index < N) {
        temp[threadIdx.x] = a[index] * b[index];
    } else {
        temp[threadIdx.x] = 0;
    }
    __syncthreads(); // Wait for all threads to fill temp

    // Perform parallel reduction
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        __syncthreads();
        if (threadIdx.x < stride) {
            temp[threadIdx.x] += temp[threadIdx.x + stride];
        }
    }

    // Write the result for this block to global memory
    if (threadIdx.x == 0) {
        c[blockIdx.x] = temp[0];
    }
}