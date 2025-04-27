#include "hip/hip_runtime.h"
#include "includes.h"

#define N 10

using namespace std;

__global__ void add(int *a, int *b, int *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread ID
    if (i < N)
        c[i] = a[i] + b[i];  // Perform addition if within bounds
}