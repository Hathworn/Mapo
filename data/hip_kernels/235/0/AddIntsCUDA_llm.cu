#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
# define size 5

// Global functions

//********************************************************
__global__ void AddIntsCUDA(int *a, int *b)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use if condition to prevent out of bounds
    if (tid < size) {
        a[tid] += b[tid];
    }
}