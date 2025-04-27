#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sequence_gpu(int *d_ptr, int length)
{
    int elemID = blockIdx.x * blockDim.x + threadIdx.x;

    // Utilizes cooperative threads to efficiently initialize indices
    if (elemID >= length) return;

    d_ptr[elemID] = elemID;
}