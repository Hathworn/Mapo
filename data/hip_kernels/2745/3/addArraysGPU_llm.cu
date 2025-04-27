#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addArraysGPU(int* a, int* b, int* c, int n) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < n) { // Ensure within bounds
        c[i] = a[i] + b[i];
    }
}