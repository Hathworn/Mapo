#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelGetPhi3(const int N, double *T, double *q)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N)
    {
        double qi = q[i];  // Load q[i] into register for reuse
        T[i] = qi * qi * qi;  // Compute cube using register value
    }
}