```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(const int *a, const int *b, int *c){
    // Use shared memory to minimize global memory access
    __shared__ int sum_shared;

    // Calculate sum using shared memory
    sum_shared = *a + *b;

    // Store result back to global memory
    *c = sum_shared;
}