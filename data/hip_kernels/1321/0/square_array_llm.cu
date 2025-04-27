#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Use int for idx and pre-compute blockDim.x for efficiency
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < N) {
        float value = a[idx]; // Load value to register
        a[idx] = value * value; // Compute square and store
    }
}