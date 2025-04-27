#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_long(long* x, int leng) {
    // Use built-in variable for efficiency
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < leng) {
        printf("%ld,", x[i]);
    }
}