#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to add scalar value 'b' to each element in array 'a'
extern "C"
__global__ void addScalar(int n, float *a, float b, float *result)
{
    // Optimize calculation of global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Efficient boundary check for threads working within the array bounds
    if (i < n)
    {
        // Perform vector addition computation
        result[i] = a[i] + b;
    }
}