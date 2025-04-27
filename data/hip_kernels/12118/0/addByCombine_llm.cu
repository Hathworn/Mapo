#include "hip/hip_runtime.h"
#include "includes.h"

#define N (2048*2048)
#define N_THREADS_PER_BLOCK 512

// Optimize memory access by checking index validity within device 
__global__ void addByCombine(int *a, int *b, int *c)
{
    int index = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    if (index < N) { // Ensure index is within bounds
        c[index] = a[index] + b[index];
    }
}