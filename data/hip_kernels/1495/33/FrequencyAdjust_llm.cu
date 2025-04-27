#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void FrequencyAdjust(int* OCTData, float* KSpaceData, float* PXScale, int* IndexArray, int CutIndex, int SizeX, int SizeY, int SizeZ)
{
    int id = blockIdx.y * gridDim.x * gridDim.z * blockDim.x +   // Calculate global thread index
             blockIdx.x * gridDim.z * blockDim.x +               //
             blockIdx.z * blockDim.x +                           //
             threadIdx.x;

    if (id >= SizeX * SizeY * SizeZ)
    {
        return; // Remove printf for efficiency
    }

    int idZ = id % SizeZ; // Calculate local Z index
    // Check conditions and initialize KSpaceData if needed
    if (IndexArray[idZ] == -1 || idZ >= CutIndex || idZ == 0)
    {
        KSpaceData[id] = 0;
        return;
    }

    // Compute previous PXScale index with clamp
    int LastPXScaleIndex = max(0, IndexArray[idZ] - 1); 

    // Simplified calculation for m and c
    double delta = PXScale[IndexArray[idZ]] - PXScale[LastPXScaleIndex];
    if (delta != 0) // Ensure division is valid
    {
        double m = (double)(OCTData[id] - OCTData[id - 1]) / delta;
        double c = OCTData[id] - m * PXScale[IndexArray[idZ]];
        KSpaceData[id] = m * idZ + c;
    }
    else
    {
        KSpaceData[id] = OCTData[id]; // Handle division by zero gracefully
    }
}