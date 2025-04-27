#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int *a, int *b, int *c, int n, int m) {
    // Use flattened block indexing for consistent thread allocation
    int index = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.y * gridDim.x;
    if (index < n * m) {
        c[index] = a[index] + b[index];
    }
}