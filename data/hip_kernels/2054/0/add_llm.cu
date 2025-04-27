#include "hip/hip_runtime.h"
#include "includes.h"
#define N 512

__global__ void add(int *a, int *b, int *c) {
    // Use threadIdx.x for better granularity
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < N) {
        c[index] = a[index] + b[index];  // Utilize more threads
    }
}