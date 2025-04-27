#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void device_add(int *a, int *b, int *c) {
    // Calculate global thread index to handle larger data sets
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute c[index] only if within bounds (assuming N is array size)
    if (index < N) {
        c[index] = a[index] + b[index];
    }
}