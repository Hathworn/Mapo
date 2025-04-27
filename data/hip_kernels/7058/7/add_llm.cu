#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int * A, int * B, int * C){
    // Calculate global thread index
    int thread = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure we do not go out of bounds
    if(thread < gridDim.x * blockDim.x) {
        C[thread] = A[thread] + B[thread];
    }
}