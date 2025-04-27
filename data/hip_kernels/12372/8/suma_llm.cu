#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c) {
    // Using blockIdx.x allows for modular use in grid-based parallelism
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        *c = a + b; // Perform the operation within a conditional block, ensuring only one thread executes it.
    }
}