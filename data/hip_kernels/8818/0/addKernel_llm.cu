#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addKernel(int *c, const int *a, const int *b, int size) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size) {
        // Apply loop unrolling for improved instruction throughput
        if (i + 3 < size) {
            c[i] = a[i] + b[i];
            c[i + 1] = a[i + 1] + b[i + 1];
            c[i + 2] = a[i + 2] + b[i + 2];
            c[i + 3] = a[i + 3] + b[i + 3];
        } else {
            c[i] = a[i] + b[i];
        }
    }
}