#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void add_float(int n, float *a, float *b, float *sum) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= n) return; // Exit early if index is out of bounds
    sum[i] = a[i] + b[i]; // Perform addition
}