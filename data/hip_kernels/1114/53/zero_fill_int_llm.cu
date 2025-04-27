#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void zero_fill_int(int *d_array, int size) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Avoid branching by changing the boundary check
    if (i < size) {
        d_array[i] = 0;
    }
}