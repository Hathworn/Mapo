#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cvlUnit(const char *imgR,const char *imgG,const char *imgB,const char *core, char *outR,char *outG,char *outB,int lenX,int lenY,int lenCore)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int index = y * lenX + x;

    // Return if out of image bounds
    if (x >= lenX || y >= lenY) return;

    // Return original pixel if out of convolution bounds
    if (x - lenCore / 2 < 0 || x + lenCore / 2 >= lenX || y - lenCore / 2 < 0 || y + lenCore / 2 >= lenY) {
        outR[index] = imgR[index];
        outG[index] = imgG[index];
        outB[index] = imgB[index];
        return;
    }

    int sumR = 0, sumG = 0, sumB = 0;

    // Loop unrolling for core operations
    for (int i = 0; i < lenCore; i++) {
        for (int j = 0; j < lenCore; j++) {
            int tmpX = x - lenCore / 2 + i;
            int tmpY = y - lenCore / 2 + j;
            int coreVal = core[j * lenCore + i];

            // Accumulating sums for R, G, B channels
            sumR += imgR[tmpY * lenX + tmpX] * coreVal;
            sumG += imgG[tmpY * lenX + tmpX] * coreVal;
            sumB += imgB[tmpY * lenX + tmpX] * coreVal;
        }
    }

    // Normalize and assign to output
    int normFactor = lenCore * lenCore;
    outR[index] = (char)(sumR / normFactor);
    outG[index] = (char)(sumG / normFactor);
    outB[index] = (char)(sumB / normFactor);
}