#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double2 subtract(double2 a, double2 b) {
    return {a.x - b.x, a.y - b.y};
}

__global__ void subtract_test(double2 *a, double2 *b, double2 *c) {
    // Optimize by utilizing thread index for parallel computation
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    c[index] = subtract(a[index], b[index]);
}