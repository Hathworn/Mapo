#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void FindMinSample(float* DistanceBuffer, short2* IndexBuffer, int spread, int mapSizeX, int mapSizeY)
{
    int kOffset = CUDASTDOFFSET;
    
    // Pre-check index bounds for better performance
    if (kOffset + spread < mapSizeX * mapSizeY)
    {
        float distance1 = DistanceBuffer[kOffset];
        float distance2 = DistanceBuffer[kOffset + spread];
        short2 index1 = IndexBuffer[kOffset];
        short2 index2 = IndexBuffer[kOffset + spread];
        
        // Directly compute without temporary storage
        bool isDistance1Smaller = distance1 < distance2;
        DistanceBuffer[kOffset] = isDistance1Smaller ? distance1 : distance2;
        IndexBuffer[kOffset] = isDistance1Smaller ? index1 : index2;
    }
}