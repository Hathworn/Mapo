#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_long(long* x, int leng) {
    // Cached blockDim.x for improved performance
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to prevent out of range errors
    if (idx < leng) {
        printf("%ld,", x[idx]);
    }
}