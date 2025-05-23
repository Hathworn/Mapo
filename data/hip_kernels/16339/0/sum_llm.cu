#include "hip/hip_runtime.h"
#include "includes.h"

#define N 18

__global__ void sum(double *a, double *b, double *c) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if (index < N) { // Ensure index is within bounds
        c[index] = a[index] + b[index];
    }
}