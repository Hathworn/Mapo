#include "hip/hip_runtime.h"
#include "includes.h"

#define SIZE 1024

__global__ void vectorAdd(int *a, int *b, int *c, int n)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x; 

    // Ensure thread is within bounds
    if(i < n) 
        c[i] = a[i] + b[i];
}