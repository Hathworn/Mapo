#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSgatherI2I_kernel(const int* keys, const int* indicesX, const int* indicesY, const int* indicesK, int* outX, int* outY, int* outK, unsigned int nbElements)
{
    // Calculate unique global thread index
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we do not read/write out of bounds
    if (index < nbElements) {
        const int key = keys[index];
        outX[index] = indicesX[key];
        outY[index] = indicesY[key];
        outK[index] = indicesK[key];
    }
}