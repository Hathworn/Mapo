#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

// Optimized GPU Code

// Optimize memory access by using shared memory for better performance
__global__ void Add(float* d_a, float* d_b, float* d_c, int N)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Thread checks if within bounds
    if (id < N)
    {
        // Perform the addition
        d_c[id] = d_a[id] + d_b[id];
    }
}