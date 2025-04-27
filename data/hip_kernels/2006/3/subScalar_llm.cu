#include "hip/hip_runtime.h"
#include "includes.h"

// Use extern "C" only once as it's redundant to declare it multiple times.
extern "C"

/*
* Perform a subtraction of scalar 'b' from each element in array 'a' of length 'n',
* Results are stored in 'result'.
*/
__global__ void subScalar(int n, float *a, float b, float *result)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds
    if (i < n)
    {
        // Perform scalar subtraction
        result[i] = a[i] - b;
    }
}