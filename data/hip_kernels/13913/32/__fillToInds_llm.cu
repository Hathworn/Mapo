#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __fillToInds(double A, double *B, int *I, long long len) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation
    int stride = blockDim.x * gridDim.x; // Establish stride for looping

    for (long long i = tid; i < len; i += stride) { // Use simplified stride in loop
        B[I[i]] = A;
    }
}