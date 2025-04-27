#include "hip/hip_runtime.h"
#include "includes.h"
const float PI = 3.14159265359;
const float HALFPI = 0.5*PI;
texture<unsigned char, hipTextureType3D, hipReadModeElementType> tcExpData;
texture<float, hipTextureType2D, hipReadModeElementType> tfG;

typedef struct {
    int iNPixelJ, iNPixelK;
    float fPixelJ, fPixelK;
    float afCoordOrigin[3];
    float afNorm[3];
    float afJVector[3];
    float afKVector[3];
    float fNRot, fAngleStart, fAngleEnd;
} DetInfo;

__global__ void create_bin_expimages(char* acExpDetImages, const int* aiDetStartIdx, const float* afDetInfo, const int iNDet, const int iNRot, const int* aiDetIndex, const int* aiRotN, const int* aiJExp, const int* aiKExp, const int iNPeak) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread operates within bounds
    if (i < iNPeak) {
        // Pre-compute indices
        int detIndex = aiDetIndex[i];
        int startIdx = aiDetStartIdx[detIndex];
        int nPixelJ = int(afDetInfo[0 + 19 * detIndex]);
        int nPixelK = int(afDetInfo[1 + 19 * detIndex]);
        
        // Calculate the offset for image indexing
        int offset = startIdx + aiRotN[i] * nPixelJ * nPixelK + aiKExp[i] * nPixelJ + aiJExp[i];
        
        // Set the image pixel to 1
        acExpDetImages[offset] = 1;
    }
}