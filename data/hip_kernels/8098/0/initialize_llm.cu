#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 1024
#define TIME 3600000

__global__ void initialize(float *a_d, float *b_d, float *c_d, int arraySize)
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Reduced the number of conditions evaluated
    if (ix < arraySize)
    {
        if (ix == 0)
        {
            a_d[ix] = 200.0f;  // Initialize first element with 200.0
            b_d[ix] = 200.0f;  // Initialize first element with 200.0
        }
        else
        {
            a_d[ix] = 0.0f;    // Initialize remaining elements with 0.0
            b_d[ix] = 0.0f;    // Initialize remaining elements with 0.0
        }
    }
}