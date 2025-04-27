#include "hip/hip_runtime.h"
#include "includes.h"
double* x;
int numSMs;

__global__ void printdd(int* pos, int size) {
    // Use each thread to access a specific element in parallel
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < size) {
        printf("csr %d\n", pos[idx]);
    }
}