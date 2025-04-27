#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void suma(int a, int b, int *c) {
    // Use temp variable for result to minimize global memory access
    int sum = a + b;

    // Ensure only one thread modifies *c to avoid data race if multiple blocks are used
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *c = sum;
    }
}