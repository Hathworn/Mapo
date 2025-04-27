#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernelGenerateTriangles(int *voronoiPtr, short2 *patternPtr, int3 *ctriangles, int *offset, int width, int min, int max) {
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    if (x < min || x >= max)
        return;

    int xwidth = x * width;
    short2 pattern = patternPtr[xwidth + min];
    int i0, i1, i2, i3;
    int3 *pT = &ctriangles[offset[x - 1]];

    // Jump through all voronoi vertices in a texture row
    while (pattern.y > 0 && pattern.y < max) {
        i0 = voronoiPtr[xwidth + pattern.y];
        i1 = voronoiPtr[xwidth + pattern.y + 1];
        i2 = voronoiPtr[xwidth + width + pattern.y + 1];
        i3 = voronoiPtr[xwidth + width + pattern.y];

        // Use a switch case for better readability and performance
        switch (pattern.x) {
            case 0:
                *pT = make_int3(i3, i1, i2);
                break;
            case 1:
                *pT = make_int3(i0, i2, i3);
                break;
            case 2:
                *pT = make_int3(i1, i3, i0);
                break;
            case 3:
                *pT = make_int3(i2, i0, i1);
                break;
            case 4:
                // Generate 2 triangles
                *pT = make_int3(i2, i0, i1);
                pT++;
                *pT = make_int3(i3, i0, i2);
                break;
        }

        // Move to the next pattern
        pT++;
        pattern = patternPtr[xwidth + pattern.y + 1];
    }
}