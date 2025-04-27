#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void InitArrays(float *ip, float *op, float *fp, int *kp, int ncols)
{
    int blockOffset = blockIdx.x * ncols;   // Calculate the offset of the row
    int colsPerThread = ncols / blockDim.x; // The number of cols per thread
    int rowStartPos = threadIdx.x * colsPerThread; // Calculate offset into the row

    float* ippos = ip + blockOffset + rowStartPos;
    float* fppos = fp + blockOffset + rowStartPos;
    float* oppos = op + blockOffset + rowStartPos;
    int* kppos = kp + blockOffset + rowStartPos;

    // Initialize arrays
    for (int i = 0; i < colsPerThread; i++) {
        fppos[i] = NOTSETLOC;
        ippos[i] = 50;
        oppos[i] = 50;
        kppos[i] = 1;
    }

    // Set boundary conditions
    if (rowStartPos == 0 || blockOffset == 0) {
        for (int i = 0; i < colsPerThread; i++) {
            fppos[i] = SETLOC;
            ippos[i] = 0;
            oppos[i] = 0;
            kppos[i] = 0;
        }
    }

    if (rowStartPos + colsPerThread >= ncols || blockOffset == ncols - 1) {
        for (int i = 0; i < colsPerThread; i++) {
            fppos[i] = SETLOC;
            ippos[i] = 100;
            oppos[i] = 100;
            kppos[i] = 0;
        }
    }

    // Special cases
    if (blockOffset == 400 && rowStartPos < 330) {
        int end = min(colsPerThread, 330 - rowStartPos);
        for (int i = 0; i < end; i++) {
            fppos[i] = SETLOC;
            ippos[i] = 100;
            oppos[i] = 100;
            kppos[i] = 0;
        }
    } else if (blockOffset == 200 && rowStartPos <= 500 && rowStartPos + colsPerThread >= 500) {
        int i = 500 - rowStartPos;
        fppos[i] = SETLOC;
        ippos[i] = 100;
        oppos[i] = 100;
        kppos[i] = 0;
    }
}