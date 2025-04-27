#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int n) {
    // Use block index and thread index for better parallelism
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < n)
        array[tid] = array[tid] * array[tid];
}