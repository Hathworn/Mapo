```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fmad_kernel(double x, double y, double *out)
{
    // Use shared memory to store results, reducing global memory access
    __shared__ double result;

    int tid = threadIdx.x;
    if (tid == 0)
    {
        // Perform operation and store in shared memory
        result = x * x + y;
    }

    // Ensure all threads have computed and written to shared memory
    __syncthreads();

    if (tid == 0)
    {
        // Write the result from shared memory to the global memory
        *out = result;
    }
}