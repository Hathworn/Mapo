#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sub3(float *val1, float *val2, int *num_elem)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < *num_elem) { // Ensure thread does not exceed vector bounds
        val1[i] += val2[i] + 1;
    }
}