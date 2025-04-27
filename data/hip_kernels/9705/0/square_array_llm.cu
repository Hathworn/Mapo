#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride for grid-stride loop
    for (int i = idx; i < N; i += stride) // Use grid-stride loop to increase parallelism
    {
        a[i] = a[i] * a[i];
    }
}