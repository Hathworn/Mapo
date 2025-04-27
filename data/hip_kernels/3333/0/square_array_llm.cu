#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Calculate the thread index using block and grid size
    int idx = (blockIdx.x * blockDim.x) + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop through the array with stride to handle larger arrays
    for (int i = idx; i < N; i += stride)
    {
        a[i] = a[i] * a[i];
    }
}