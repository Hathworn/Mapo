```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function by utilizing shared memory
__global__ void fillKernel(int *a, int n) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Check boundary condition only once
    if (tid < n) {
        a[tid] = tid;
    }
}