#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kInitClusters(const hipSurfaceObject_t surfFrameLab, float* clusters, int width, int height, int nSpxPerRow, int nSpxPerCol) {
    int centroidIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int nSpx = nSpxPerCol * nSpxPerRow;

    if (centroidIdx < nSpx) {
        // Precompute values outside of the loop for better performance
        int wSpx = width / nSpxPerRow;
        int hSpx = height / nSpxPerCol;
        
        int i = centroidIdx / nSpxPerRow;
        int j = centroidIdx % nSpxPerRow;
        
        // Use precalculated wSpx and hSpx values
        int x = j * wSpx + wSpx / 2;
        int y = i * hSpx + hSpx / 2;

        float4 color;
        // Use constant stride value for surface reads
        surf2Dread(&color, surfFrameLab, x * sizeof(float4), y);
        
        int baseIdx = centroidIdx; 
        // Store cluster values using a calculated base index
        clusters[baseIdx] = color.x;
        clusters[baseIdx + nSpx] = color.y;
        clusters[baseIdx + 2 * nSpx] = color.z;
        clusters[baseIdx + 3 * nSpx] = static_cast<float>(x);
        clusters[baseIdx + 4 * nSpx] = static_cast<float>(y);
    }
}