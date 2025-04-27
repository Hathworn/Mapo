```c
#include "hip/hip_runtime.h"
#include "includes.h"

// WARNING : device_sum size should be gridDim.x
__global__ void vec_thetest(int n, float *kz_is_imag)
{
    // Calculate the global thread ID
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x + threadIdx.y * gridDim.x * blockDim.x;

    // Ensure thread ID is within bounds
    if (id < n)
    {
        // Output the value at the given index
        printf("kz -> %d  %f\n", id, kz_is_imag[id]);
    }
}