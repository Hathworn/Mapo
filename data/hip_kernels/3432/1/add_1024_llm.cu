#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_1024(long* a, long* b, long* c, long N) {
    // Calculate global index
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Perform element-wise multiplication
    if (idx < N) {
        c[idx] = a[idx] * b[idx];
    }
    __syncthreads();

    // Reduction using shared memory for better performance
    extern __shared__ long shared_c[];
    if (idx < N) {
        shared_c[threadIdx.x] = c[idx];
    }
    __syncthreads();

    for (long step = blockDim.x / 2; step > 0; step /= 2) {
        if (threadIdx.x < step && threadIdx.x + step < N) {
            shared_c[threadIdx.x] += shared_c[threadIdx.x + step];
        }
        __syncthreads();
    }

    // Write result back to global memory
    if (threadIdx.x == 0) {
        c[blockIdx.x] = shared_c[0];
    }
}