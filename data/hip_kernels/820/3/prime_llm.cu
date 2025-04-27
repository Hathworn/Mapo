#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prime(int *a, int *b, int *c, int vector_size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride for better utilization of threads
    int stride = blockDim.x * gridDim.x;

    // Continue processing until all elements are handled
    for (int i = tid; i < vector_size; i += stride) {
        c[i] = a[i] + b[i];
    }
}