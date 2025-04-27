#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void MinusByFittingFunction(int* OCTData, float* PolyValue, int SizeZ)
{
    // Calculate unique thread id for flattened 3D block and grid configuration
    int id = blockIdx.y * gridDim.x * gridDim.z * blockDim.x + 
             blockIdx.x * gridDim.z * blockDim.x + 
             blockIdx.z * blockDim.x + 
             threadIdx.x;

    // Ensure id is within bounds
    if (id < gridDim.x * gridDim.y * gridDim.z * blockDim.x) {
        // Extract the Z-index and adjust OCTData
        int idZ = id % SizeZ;
        OCTData[id] -= PolyValue[idZ];
    }
}