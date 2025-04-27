#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZE 32

__global__ void AddVectors(int* a, int* b, int* c)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Each thread calculates its own index
    if (tid < SIZE)
    {
        c[tid] = a[tid] + b[tid];
    }
}