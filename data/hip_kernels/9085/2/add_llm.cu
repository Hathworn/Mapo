#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c) { 
    // Use shared memory for faster access
    extern __shared__ int shared_mem[];
    
    // Compute the sum and store it in shared memory
    shared_mem[0] = a + b;

    // Write the result from shared memory to global memory
    *c = shared_mem[0];
}