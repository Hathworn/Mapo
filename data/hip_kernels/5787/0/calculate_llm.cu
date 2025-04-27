#include "hip/hip_runtime.h"
#include "includes.h"

#define N 512

__global__ void calculate(int *a, int *b, int *c){
    int idx = threadIdx.x; // Cache thread index for reuse
    int temp = a[idx] + 2; // Precompute repeated expression
    c[idx] = (temp + b[idx]) * 3; // Use cached value in final computation
}