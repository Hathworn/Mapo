#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(int* a, int* b, int* c, int n) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure valid access 
    if (tid < n) {
        c[tid] = a[tid] + b[tid];
    }
}