#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups()
{
    // Use __syncthreads() to synchronize threads within the same thread block
    __syncthreads();
}