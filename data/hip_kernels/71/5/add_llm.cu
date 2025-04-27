```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int a, int b, int *c) {
    // Use local variable for intermediate result
    int sum = a + b;
    // Store the result to global memory
    *c = sum;
}