#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add( int *a, int *b, int *c, int vector_size ) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID

    if (tid < vector_size) {
        c[tid] = a[tid] + b[tid]; // Perform addition if within bounds
    }
}