#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KernelPrintInts(const int* p, int len) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the index is within bounds
    if (idx < len) {
        printf("%d\n", p[idx]);
    }
}