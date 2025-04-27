```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_hadamard(int N, double *wt, double *x) {
    // Calculate the global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread ID is within bounds and align memory access
    if (tid < N) {
        x[tid] *= wt[tid];
    }
}