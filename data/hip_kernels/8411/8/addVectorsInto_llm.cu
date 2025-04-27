#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addVectorsInto(float *result, float *a, float *b, int N)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    if (idx < N) {
        result[idx] = a[idx] + b[idx]; // Perform addition for valid index
    }
}