#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread ID
    int stride = gridDim.x * blockDim.x; // Calculate stride for entire grid
    while (tid < N) {
        c[tid] = a[tid] + b[tid]; // Perform addition
        tid += stride; // Move to the next element for this thread
    }
}