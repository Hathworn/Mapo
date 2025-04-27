#include "hip/hip_runtime.h"
#include "includes.h"

#define WARP_SIZE 32 // # of threads that are executed together (constant valid on most hardware)

// CPU entry point for kernel to add "scalar" to every element of the input array
__global__ void _cuda_add_scalar(int *in, int scalar, int n)
{
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate stride only once outside loop for efficiency
    for (; globalIdx < n; globalIdx += stride) // Use for loop for clarity and potential optimization
    {
        in[globalIdx] += scalar; // Directly add scalar to improve readability
    }
}