#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double2 mult(double2 a, double2 b){
    return {a.x*b.x - a.y*b.y, a.x*b.y + a.y*b.x};
}

__device__ double2 mult(double2 a, double b){
    return {a.x*b, a.y*b};
}

__global__ void mult_test(double2 *a, double2 *b, double2 *c){
    // Optimize global memory access by using shared memory and threadIdx for parallel processing.
    __shared__ double2 s_a, s_b;

    if (threadIdx.x == 0) {
        s_a = a[0];
        s_b = b[0];
    }
    __syncthreads();

    if (threadIdx.x == 0) {
        c[0] = mult(s_a, s_b);
    }
}