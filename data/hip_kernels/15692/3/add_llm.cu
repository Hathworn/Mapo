#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c) {
    // Use local variable to reduce global memory access latency
    int result = a + b;
    
    // Efficient single write to global memory
    if (threadIdx.x == 0 && blockIdx.x == 0) {
        *c = result;
    }
}