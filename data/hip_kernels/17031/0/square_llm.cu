#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int n) {
    // Use combined identification for threads
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid < n) {
        array[tid] = array[tid] * array[tid];
    }
}