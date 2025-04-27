#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void AddIntsCuda(int *a, int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (i < N) // Ensure within bounds, N should be defined as the size of the arrays
    {
        a[i] += b[i];
    }
}