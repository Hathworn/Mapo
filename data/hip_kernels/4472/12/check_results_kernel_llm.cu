#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void check_results_kernel(int n, double correctvalue, double *x)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n)
    {
        double xi = x[i]; // Load x[i] once
        if (xi != correctvalue) // Compare with preloaded value
        {
            printf("ERROR at index = %d, expected = %f, actual: %f\n", i, correctvalue, xi);
        }
    }
}