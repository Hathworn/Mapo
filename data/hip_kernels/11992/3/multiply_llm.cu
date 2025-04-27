#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply(int a, int b, int *c) {
    // Use shared memory to reduce global memory access
    __shared__ int product;

    // Perform multiplication in shared memory
    product = a * b;

    // Store the result from shared memory to global memory
    *c = product;
}