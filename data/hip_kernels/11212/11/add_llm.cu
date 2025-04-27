#include "hip/hip_runtime.h"
#include "includes.h"
__device__ int addem( int a, int b ) {
    return a + b;
}

// Optimized kernel function
__global__ void add( int a, int b, int *c ) {
    int result = addem(a, b); // Use local register for intermediate result
    if (threadIdx.x == 0) { // Ensure only one thread writes to *c
        *c = result;
    }
}