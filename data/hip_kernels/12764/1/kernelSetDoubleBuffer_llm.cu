#include "hip/hip_runtime.h"
#include "includes.h"

/**
* @brief cudaCreateBuffer Allocates a cuda buffer and stops the programm on error.
* @param size
* @return
*/
__global__ void kernelSetDoubleBuffer(float* gpuBuffPtr, float v, size_t size)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check index within bounds and assign value
    if (index < size) {
        gpuBuffPtr[index] = v;
    }
}