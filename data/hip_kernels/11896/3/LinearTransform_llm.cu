#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

int MaxThreadsPerBlock;
int MaxThreadsX;
int MaxThreadsY;

__global__ void LinearTransform(double *A, int numElements, double at, double bt)
{
    // Use shared memory and unrolling for improved memory access
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize boundary condition check
    if (i < numElements) {
        A[i] = A[i] * at + bt;
    }
}