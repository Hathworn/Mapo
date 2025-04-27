```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_add(int *a, int *b, int *c, int n) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we do not access out-of-bounds memory
    if (index < n) {
        c[index] = a[index] + b[index];
    }
}