#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_double(int n, double *a, double *b, double *sum) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use loop to handle multiple elements per thread to improve load balance
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        sum[idx] = a[idx] + b[idx];
    }
}