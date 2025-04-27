#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Improved order for better readability
    if (index < SIZE) {
        c[index] = a[index] + b[index]; // Maintain straightforward element addition
    }
}