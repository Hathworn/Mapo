#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void check_results_kernel(int n, double correctvalue, double *x)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use conditional assignment to reduce the number of branches
    bool incorrect = (i < n) && (x[i] != correctvalue);

    if (incorrect)
    {
        printf("ERROR at index = %d, expected = %f, actual: %f\n", i, correctvalue, x[i]);
    }
}