#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *output, int length, int *n1, int *n2) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    if (idx < length) {  // Ensure index within bounds
        output[idx] += n1[blockIdx.x] + n2[blockIdx.x];  // Perform operation
    }
}