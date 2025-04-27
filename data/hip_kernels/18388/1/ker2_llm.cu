#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

long long remaining_N2(int , int ,long long );
long long remaining_N(int , int ,int );

__global__ void ker2(float * cormat, float * upper, int n1, int n, long long upper_size, int N, int i_so_far, long long M1)
{
    // Calculate the global index using built-in functions for efficiency
    long long idx = blockIdx.x * blockDim.x + threadIdx.x; 
    long i = idx / n;
    long j = idx % n;

    // Reduce condition checks for efficiency
    if (i < n1 && j < n && i < j)
    {
        long long tmp_2 = i * n - i * (i + 1) / 2 + j - i;
        long long indexi = n1 * j + i;
        upper[tmp_2 - 1] = cormat[indexi];
    }
}