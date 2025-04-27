#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void set_arr(float b, float * c, int N)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (idx < N) {
        c[idx] = b;  // Assign value b to the element
    }
}