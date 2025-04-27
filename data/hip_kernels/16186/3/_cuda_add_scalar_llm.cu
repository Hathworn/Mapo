#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _cuda_add_scalar(int *in, int scalar, int n)
{
    // Calculate the global index of the thread
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unrolling the loop for better performance
#pragma unroll
    for (int idx = globalIdx; idx < n; idx += blockDim.x * gridDim.x)
    {
        in[idx] += scalar; // Update the array element by adding the scalar
    }
}