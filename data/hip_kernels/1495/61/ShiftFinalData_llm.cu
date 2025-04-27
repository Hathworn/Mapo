#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void ShiftFinalData(float* AfterFFTData, float* ShiftData, int SizeX, int SizeY, int FinalSizeZ, int FinalDataSize)
{
    // Calculate linear thread id
    int id = blockIdx.y * gridDim.x * gridDim.z * blockDim.x + 
             blockIdx.x * gridDim.z * blockDim.x + 
             blockIdx.z * blockDim.x + 
             threadIdx.x;

    // Ensure id is within bounds
    if (id >= FinalDataSize) return;

    // Calculate indices for Z, X, and Y
    int idZ = id % FinalSizeZ;
    int tempIndex = id / FinalSizeZ;
    int idX = tempIndex % SizeX;
    int idY = tempIndex / SizeX;

    // Wrap SizeY
    idY = (idY + SizeY / 2) % SizeY;

    // Compute new index
    int NewIndex = idY * SizeX * FinalSizeZ + idX * FinalSizeZ + idZ;

    // Assign shifted data
    ShiftData[id] = AfterFFTData[NewIndex];
}