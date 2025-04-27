#include "hip/hip_runtime.h"
#include "includes.h"

#define THREADS_PER_BLOCK 1024
#define TIME 3600000

__global__ void compute(float *a_d, float *b_d, float *c_d, int arraySize)
{
    int ix = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (ix > 0 && ix < arraySize-1) {
        float temp = (a_d[ix+1] + a_d[ix-1]) / 2.0f; // Compute average of neighboring elements
        b_d[ix] = temp; // Store result in b_d
    }
}