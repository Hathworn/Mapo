#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Calculate the unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop for better utilization of GPU resources
    for (int i = idx; i < N; i += blockDim.x * gridDim.x) {
        a[i] = a[i] * a[i];
    }
}