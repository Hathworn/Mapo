#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square(int *array, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Use full threading hierarchy to generate unique thread id
    if (tid < n) {
        array[tid] *= array[tid]; // Simplify expression
    }
}