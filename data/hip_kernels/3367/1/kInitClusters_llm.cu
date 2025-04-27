#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kInitClusters(const hipSurfaceObject_t surfFrameLab, float* clusters, int width, int height, int nSpxPerRow, int nSpxPerCol) {
    // Calculate the global index for the current thread
    int centroidIdx = blockIdx.x * blockDim.x + threadIdx.x;
    int nSpx = nSpxPerCol * nSpxPerRow;

    // Process only within the valid range
    if (centroidIdx < nSpx) {
        int wSpx = width / nSpxPerRow; // Width of each superpixel
        int hSpx = height / nSpxPerCol; // Height of each superpixel

        int i = centroidIdx / nSpxPerRow; // Row index of centroid
        int j = centroidIdx % nSpxPerRow; // Column index of centroid

        // Compute the central coordinates of the superpixel
        int x = j * wSpx + wSpx / 2;
        int y = i * hSpx + hSpx / 2;

        float4 color;
        // Efficiently read color values using surface object
        surf2Dread(&color, surfFrameLab, x * sizeof(float4), y); // Use sizeof(float4) for proper byte addressing

        // Store the color and spatial information into the cluster array
        clusters[centroidIdx] = color.x;
        clusters[centroidIdx + nSpx] = color.y;
        clusters[centroidIdx + 2 * nSpx] = color.z;
        clusters[centroidIdx + 3 * nSpx] = x;
        clusters[centroidIdx + 4 * nSpx] = y;
    }
}