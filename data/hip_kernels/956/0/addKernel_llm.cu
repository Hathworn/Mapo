#include "hip/hip_runtime.h"
#include "includes.h"
# pragma warning (disable:4819)

#define ARRAYSIZE 5

__global__ void addKernel(int *c, const int *a, const int *b) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < ARRAYSIZE) { // Ensure index is within bounds
        c[i] = a[i] + b[i];
    }
}