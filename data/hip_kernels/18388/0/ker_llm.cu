#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

long long remaining_N2(int , int ,long long );
long long remaining_N(int , int ,int );

// Optimized kernel function
__global__ void ker(float * cormat, float * upper, int n1, int n)
{
    long idx = blockDim.x * blockIdx.x + threadIdx.x;
    long i = idx % n1;
    long j = idx / n1;
    
    // Check condition where i < j, eliminating unnecessary operations
    if (i < j && j < n)
    {
        long tmp_2 = i * n + j - (i * (i + 1) / 2) - i;
        
        // Access global memory more efficiently
        upper[tmp_2 - 1] = cormat[j * n + i];
    }
}