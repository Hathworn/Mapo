#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    int idx = threadIdx.x; // Use thread index for operation
    c[idx] = a[idx] + b[idx]; // Utilize parallel execution for element-wise addition
}