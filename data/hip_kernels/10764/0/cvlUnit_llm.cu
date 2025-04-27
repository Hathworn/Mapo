#include "hip/hip_runtime.h"
#include "includes.h"

//设备端代码
__global__ void cvlUnit(const char *imgR,const char *imgG,const char *imgB,const char *core, char *outR,char *outG,char *outB,int lenX,int lenY,int lenCore)
{
    // Calculate coordinates
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int index = y * lenX + x;
    
    // Return if out of bounds
    if (x >= lenX || y >= lenY) return;

    int halfCore = lenCore / 2;
    if (x < halfCore || x >= lenX - halfCore || y < halfCore || y >= lenY - halfCore) {
        outR[index] = imgR[index];
        outG[index] = imgG[index];
        outB[index] = imgB[index];
        return;
    }
    
    int sumR = 0, sumG = 0, sumB = 0;
    
    // Loop unrolling for kernel calculations
    for (int i = 0; i < lenCore; ++i) {
        for (int j = 0; j < lenCore; ++j) {
            int tmpX = x + i - halfCore;
            int tmpY = y + j - halfCore;
            int coreValue = core[j * lenCore + i];
            int idx = tmpY * lenX + tmpX;
            
            sumR += imgR[idx] * coreValue;
            sumG += imgG[idx] * coreValue;
            sumB += imgB[idx] * coreValue;
        }
    }

    int coreArea = lenCore * lenCore;
    outR[index] = (char)(sumR / coreArea);
    outG[index] = (char)(sumG / coreArea);
    outB[index] = (char)(sumB / coreArea);
}