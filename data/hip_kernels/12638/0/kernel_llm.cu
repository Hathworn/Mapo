#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int* count_d, float* randomnums)
{
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Optimize by calculating indices directly without extra variables
    double x = randomnums[tid * 2];
    double y = randomnums[tid * 2 + 1];
    double z = (x * x) + (y * y);
    
    // Use ternary operator for concise condition assignment
    count_d[tid] = (z <= 1) ? 1 : 0;
}