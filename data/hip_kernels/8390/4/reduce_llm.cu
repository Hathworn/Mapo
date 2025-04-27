#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(int * vector, int size, int pot) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = pot / 2;

    // Use a loop unrolling optimization strategy
    for (; stride > 0; stride >>= 1) {
        if (idx < stride && idx + stride < size) {
            vector[idx] += vector[idx + stride];
        }
        __syncthreads();
    }
}