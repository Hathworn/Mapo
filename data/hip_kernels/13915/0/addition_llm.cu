#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void addition(int *a, int *b, int *c)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    c[idx] = a[idx] + b[idx]; // Perform element-wise addition
}