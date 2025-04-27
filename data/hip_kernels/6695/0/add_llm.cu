#include "hip/hip_runtime.h"
#include "includes.h"
#define N 10

// Sum Arrays
__global__ void add(int *x, int *y, int *z) {
    int tID = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread ID
    if (tID < N) {
        z[tID] = x[tID] + y[tID]; // Perform vector addition
    }
}