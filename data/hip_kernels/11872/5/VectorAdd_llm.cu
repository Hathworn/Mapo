#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VectorAdd(int *a, int *b, int *c, int n) {
    int i = blockDim.x * blockIdx.x + threadIdx.x; // compute global index
    if (i < n)
        c[i] = a[i] + b[i]; // perform vector addition
}