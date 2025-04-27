#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel optimized for simplicity, assuming one thread will handle the operation
__global__ void addTwoIntegers(int *a, int *b, int *c)
{
    // Directly add and store result if we are using a single-threaded approach
    *c = *a + *b;
}