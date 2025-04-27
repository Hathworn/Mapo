#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double2 add(double2 a, double2 b) {
    return {a.x + b.x, a.y + b.y};
}

__global__ void add_test(double2 *a, double2 *b, double2 *c) {
    // Use threadIdx and blockIdx for parallel computing
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    c[idx] = add(a[idx], b[idx]);
}