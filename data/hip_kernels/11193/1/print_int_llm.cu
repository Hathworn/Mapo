#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_int(int* x, int leng) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Check index bounds before accessing array
    if (i < leng) {
        printf("%d,", x[i]);
    }
}