#include "hip/hip_runtime.h"
#include "includes.h"

#define NUM_THREADS 511
#define ITERATIONS 100000

using namespace std;

__global__ void kernel_map(int *values, int *next_values)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a single check for boundary condition
    if (tid >= NUM_THREADS) return;
    
    next_values[tid] = values[tid] + 1;
}