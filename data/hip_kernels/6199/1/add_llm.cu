#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c){
    // Calculate unique thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Perform addition for the calculated index
    c[idx] = a[idx] + b[idx];
}