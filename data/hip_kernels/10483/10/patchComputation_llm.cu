#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void patchComputation(int noCandidates, int W, int H, int skpx, int skpy, int xres, int yres, float subPatchArea, float xspacing, float yspacing, float capacity, int uniqueRegions, const int* labelledImage, const float* pops, float* results) {

    // Get global index of thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < noCandidates) {
        // Dimensions arranged as X->Y->R
        int rem = idx;
        int blockIdxY = idx / (xres * uniqueRegions);
        rem -= blockIdxY * (xres * uniqueRegions);
        int blockIdxX = rem / uniqueRegions;
        rem -= blockIdxX * uniqueRegions;
        // Valid region numbering starts at 1, not 0
        int regionNo = rem + 1;

        int blockSizeX = min(skpx, H - blockIdxX * skpx);  // Simplified block size calculation
        int blockSizeY = min(skpy, W - blockIdxY * skpy);

        // Precompute repeated multiplications outside the loop
        int startX = blockIdxX * skpx;
        int startY = blockIdxY * skpy;

        // Iterate through each sub patch for this large grid cell
        float area = 0.0f, cap = 0.0f, pop = 0.0f;
        float cx = 0.0f, cy = 0.0f;

        for (int ii = 0; ii < blockSizeX; ii++) {
            for (int jj = 0; jj < blockSizeY; jj++) {
                int xCoord = startX + ii;
                int yCoord = startY + jj;

                if (labelledImage[xCoord + yCoord * W] == regionNo) {
                    area += 1.0f;  // Convert boolean directly to float
                    pop += pops[xCoord + yCoord * W];
                    cx += ii;
                    cy += jj;
                }
            }
        }

        if (area > 0) {
            cx = xspacing * (cx / area + startX);
            cy = yspacing * (cy / area + startY);
            area *= subPatchArea;
            cap = area * capacity;
        }

        // Store results to output matrix
        results[5 * idx] = area;
        results[5 * idx + 1] = cap;
        results[5 * idx + 2] = pop;
        results[5 * idx + 3] = cx;
        results[5 * idx + 4] = cy;
    }
}