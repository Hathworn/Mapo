#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAdd(int* a, int* b, int* c, int n) {
    // Calculate global thread ID (tid)
    int tid = (blockIdx.x * blockDim.x) + threadIdx.x;
    // Optimize boundary guard and loop for efficiency
    for (int i = tid; i < n; i += blockDim.x * gridDim.x) {
        // Each thread adds multiple elements within its range
        c[i] = a[i] + b[i];
    }
}