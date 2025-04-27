#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int size) {
    // Use a shared memory index calculation for improved readability and potential performance gains
    int idx = size * blockIdx.x + threadIdx.x;
    c[idx] = a[idx] + b[idx];
}