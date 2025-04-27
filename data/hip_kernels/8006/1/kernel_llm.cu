#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(int *a, int dimx, int dimy) {
    // Use shared memory to reduce redundant calculations.
    __shared__ int shared_blockIdx_x, shared_threadIdx_x;  
    shared_blockIdx_x = blockIdx.x;
    shared_threadIdx_x = threadIdx.x;

    int i = shared_blockIdx_x * blockDim.x + shared_threadIdx_x;
    a[i] = shared_blockIdx_x * dimx + shared_threadIdx_x;
}