#include "hip/hip_runtime.h"
#include "includes.h"

#define imin(a,b) (a<b?a:b)

__global__ void set(double *dx, int N)
{
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use stride to cover full data set
    int stride = blockDim.x * gridDim.x;
    
    for (int i = tid; i < N; i += stride)
    {
        dx[i] = 0.0; // Initialize array element
    }
}