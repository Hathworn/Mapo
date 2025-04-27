```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void colDiv(float* a, float* b, float* c, int M, int N){

    // Use shared memory to improve memory coalescing
    __shared__ float b_shared[1024];

    // Index for block and thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (threadIdx.x < M) {
        b_shared[threadIdx.x] = b[threadIdx.x];
    }

    __syncthreads();

    // Ensure grid covers all elements, check i
    if (i < M) {
        int ind = i + blockIdx.y * M;
        c[ind] = a[ind] / b_shared[i];
    }
}