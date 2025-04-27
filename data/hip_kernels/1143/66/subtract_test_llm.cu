#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double2 subtract(double2 a, double2 b) {
    return {a.x - b.x, a.y - b.y};
}

__global__ void subtract_test(double2 *a, double2 *b, double2 *c) {
    // Use threadIdx.x assuming only processing one element in this example
    int idx = threadIdx.x;
    c[idx] = subtract(a[idx], b[idx]);
}