#include "hip/hip_runtime.h"
#include "includes.h"

__device__ double2 mult(double2 a, double2 b){
    return {a.x*b.x - a.y*b.y, a.x*b.y + a.y*b.x};
}

__device__ double2 mult(double2 a, double b){
    return {a.x*b, a.y*b};
}

__global__ void mult_test(double2 *a, double b, double2 *c){
    // Use thread index to ensure multiple threads work on different data
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Eliminate bank conflicts by ensuring coalesced access
    c[idx] = mult(a[idx], b);
}