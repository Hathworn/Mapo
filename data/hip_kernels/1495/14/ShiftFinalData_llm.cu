#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void ShiftFinalData(float* AfterFFTData, float* ShiftData, int SizeX, int SizeY, int FinalSizeZ, int FinalDataSize)
{
    // Calculate global thread ID
    int id = blockIdx.y * gridDim.x * gridDim.z * blockDim.x +
             blockIdx.x * gridDim.z * blockDim.x +
             blockIdx.z * blockDim.x +
             threadIdx.x;

    // Early exit if out of bounds
    if (id >= FinalDataSize)
    {
        return;
    }

    // Calculate indices using modulo and division
    int idZ = id % FinalSizeZ;
    int tempIndex = id / FinalSizeZ;
    int idX = tempIndex % SizeX;
    int idY = tempIndex / SizeX;

    // Adjust idY by folding back
    idY = (idY + SizeY / 2) % SizeY;

    // Compute new index and assign shifted data
    int NewIndex = idY * SizeX * FinalSizeZ + idX * FinalSizeZ + idZ;
    ShiftData[id] = AfterFFTData[NewIndex];
}