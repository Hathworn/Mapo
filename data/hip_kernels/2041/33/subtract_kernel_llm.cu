#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void subtract_kernel(float * in1, float * in2, float * out)
{
    // Optimize index calculation to avoid repeated multiplications and improve readability.
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int j = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int k = blockIdx.z * blockDim.z + threadIdx.z;

    // Use shared memory to limit global memory access when possible.
    __shared__ float shared_in1[BLOCK_SIZE];
    __shared__ float shared_in2[BLOCK_SIZE];

    if (i < c_Size.x && j < c_Size.y && k < c_Size.z)
    {
        long int id = (k * c_Size.y + j) * c_Size.x + i;

        shared_in1[threadIdx.x] = in1[id];
        shared_in2[threadIdx.x] = in2[id];

        out[id] = shared_in1[threadIdx.x] - shared_in2[threadIdx.x];
    }
}