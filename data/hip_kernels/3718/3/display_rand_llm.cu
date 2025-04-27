```c
#include "hip/hip_runtime.h"
#include "includes.h"
const float PI = 3.14159265359;
const float HALFPI = 0.5*PI;
texture<unsigned char, hipTextureType3D, hipReadModeElementType> tcExpData;
texture<float, hipTextureType2D, hipReadModeElementType> tfG;  // texture to store scattering vectors;

typedef struct {
    int iNPixelJ, iNPixelK;
    float fPixelJ, fPixelK;
    float afCoordOrigin[3];
    float afNorm[3];
    float afJVector[3];
    float afKVector[3];
    float fNRot, fAngleStart, fAngleEnd;
} DetInfo;

// Global kernel function to display random numbers
__global__ void display_rand(float* afRandom, int iNRand) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to prevent out-of-range access
    if (i < iNRand) {
        printf("=%d= %f ||", i, afRandom[i]);
    }
}