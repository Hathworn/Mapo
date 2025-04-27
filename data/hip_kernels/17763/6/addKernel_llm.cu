#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addKernel(int* c, const int* a, const int* b, int size) {
    // Calculate global index for current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread does not process beyond array size
    if (i < size) {
        c[i] = a[i] + b[i]; // Perform vector addition
    }
}