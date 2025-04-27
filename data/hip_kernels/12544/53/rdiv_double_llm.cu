#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void rdiv_double(int n, double *a, double *b, double *sum)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop over data with stride equal to grid size
    int gridSize = blockDim.x * gridDim.x;
    while (i < n) {
        sum[i] = b[i] / a[i];
        i += gridSize;
    }
}