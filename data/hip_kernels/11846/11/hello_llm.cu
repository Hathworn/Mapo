#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void hello(char *a, int *b) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index
    a[idx] += b[idx]; // Use global index for accessing arrays
}