#include "hip/hip_runtime.h"
#include "includes.h"

// Using shared memory for better performance
__global__ void print_int(int* x, int leng) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    extern __shared__ int shared_x[];

    // Load data into shared memory
    if(i < leng) {
        shared_x[threadIdx.x] = x[i];
        __syncthreads();

        // Print from shared memory
        printf("%d,", shared_x[threadIdx.x]);
    }
}