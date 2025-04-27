#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void MinusByFittingFunction(int* OCTData, float* PolyValue, int SizeZ)
{
    // Calculate unique global thread index using 3D block and grid dimensions.
    int id = (blockIdx.y * gridDim.x * gridDim.z + blockIdx.x * gridDim.z + blockIdx.z) * blockDim.x + threadIdx.x;

    // Extract the Z index using modulo operation for accessing PolyValue.
    int idZ = id % SizeZ;

    // Subtract predicted value from OCTData.
    OCTData[id] -= PolyValue[idZ];
}