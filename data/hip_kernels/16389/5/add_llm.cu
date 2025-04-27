#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int size) {
    // Calculate global thread ID once to avoid redundant computation
    int idx = size * blockIdx.x + threadIdx.x;
    // Perform the addition operation
    c[idx] = a[idx] + b[idx];
}