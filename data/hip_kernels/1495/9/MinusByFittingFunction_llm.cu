#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void MinusByFittingFunction(int* OCTData, float* PolyValue, int SizeZ)
{
    // Calculate the unique global index for the thread
    int id = (blockIdx.y * gridDim.x * gridDim.z + blockIdx.x * gridDim.z + blockIdx.z) * blockDim.x + threadIdx.x;

    // Calculate the Z index
    int idZ = id % SizeZ;

    // Subtract the fitting value from the data
    OCTData[id] -= PolyValue[idZ];
}