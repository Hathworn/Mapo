```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void square_array(float *a, int N)
{
    // Using a more efficient loop by calculating the total number of threads
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    for (int i = idx; i < N; i += stride) {
        a[i] *= a[i];
    }
}