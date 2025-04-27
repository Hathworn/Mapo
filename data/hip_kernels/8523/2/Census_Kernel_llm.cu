#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Census_Kernel(unsigned char * MemSrc, unsigned int * MemDst, int eps, int Width, int Height)
{
    // Calculate global thread position
    int globalX = blockIdx.x * blockDim.x + threadIdx.x;
    int globalY = blockIdx.y * blockDim.y + threadIdx.y;
    int GlobalOffset = globalY * Width + globalX;

    if (globalX >= 2 && globalX < Width - 2 && globalY >= 2 && globalY < Height - 2) {
        unsigned char ValueCenter = MemSrc[GlobalOffset];
        unsigned int Census = 0;

        #pragma unroll
        for (int dy = -2; dy <= 2; dy++) {
            #pragma unroll
            for (int dx = -2; dx <= 2; dx++) {
                if (!(dx == 0 && dy == 0)) {
                    unsigned char Value = MemSrc[(globalY + dy) * Width + (globalX + dx)];
                    float Diff = ValueCenter - Value;

                    // Update census bit
                    Census = (Census << 2) | (abs(Diff) <= eps ? 1 : (Diff > eps ? 2 : 0));
                }
            }
        }
        MemDst[GlobalOffset] = Census;
    } else if (globalX < Width && globalY < Height) {
        MemDst[GlobalOffset] = 0; // Handle border pixels
    }
}