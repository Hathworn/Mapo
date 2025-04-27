#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void square_array(float *a, int N)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride-based loop for better occupancy, handling more data in case of large arrays
    int stride = gridDim.x * blockDim.x;
    for (int i = idx; i < N; i += stride) {
        a[i] = a[i] * a[i];
    }
}