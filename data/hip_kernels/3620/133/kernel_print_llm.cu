#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_print( long const* p, int n)
{
    int idx = threadIdx.x; // Get thread index
    if (idx < n) // Check if index is within bounds
    {
        printf("Thread %d: %ld\n", idx, p[idx]); // Print thread index and value
    }
    if (idx == 0) // Only one thread prints the number of longs
    {
        printf("long count: %d\n", n); // Print number of longs
    }
}