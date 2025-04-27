#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void check_results_kernel(int n, double correctvalue, double *x)
{
    // Calculate global thread index in grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a conditional statement to limit unnecessary operations
    if (i < n && x[i] != correctvalue)
    {
        printf("ERROR at index = %d, expected = %f, actual: %f\n", i, correctvalue, x[i]);
    }
}