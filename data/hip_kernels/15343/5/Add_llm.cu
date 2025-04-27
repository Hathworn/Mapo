#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Add(float *a, float *b, float *c)
{
    int Id = blockIdx.x * blockDim.x + threadIdx.x;
    if (Id < N) {
        a[Id] = threadIdx.x;  // Store thread index within block
        b[Id] = blockIdx.x;   // Store block index
        c[Id] = Id;           // Store global index
    }
}