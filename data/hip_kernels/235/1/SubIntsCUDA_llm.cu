#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;
# define size 5

// Optimized global function
__global__ void SubIntsCUDA(int *a, int *b)
{
    // Optimize the calculation of the thread index using auto GPU variable
    int tid = hipThreadIdx_x + hipBlockIdx_x * hipBlockDim_x;

    // Add boundary check to prevent out-of-bounds memory access
    if (tid < size) 
    {
        // Perform the subtraction operation
        b[tid] = a[tid] - b[tid];
    }
}