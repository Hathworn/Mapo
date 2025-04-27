#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(int *vector, int N, int val)
{
    // Calculate global thread index with stride
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Loop to cover all elements with fewer threads
    for (; i < N; i += blockDim.x * gridDim.x) {
        vector[i] = val;
    }
}