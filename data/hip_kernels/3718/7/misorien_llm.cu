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

__device__ void mat3_dot(float* afResult, float* afM0, float* afM1) {
    // Optimized dot product of two 3x3 matrices
    for (int i = 0; i < 3; i++) {
        afResult[i * 3]     = afM0[i * 3] * afM1[0] + afM0[i * 3 + 1] * afM1[3] + afM0[i * 3 + 2] * afM1[6];
        afResult[i * 3 + 1] = afM0[i * 3] * afM1[1] + afM0[i * 3 + 1] * afM1[4] + afM0[i * 3 + 2] * afM1[7];
        afResult[i * 3 + 2] = afM0[i * 3] * afM1[2] + afM0[i * 3 + 1] * afM1[5] + afM0[i * 3 + 2] * afM1[8];
    }
}

__device__ void mat3_transpose(float* afOut, float* afIn) {
    // Optimized transpose of 3x3 matrix
    afOut[0] = afIn[0]; afOut[1] = afIn[3]; afOut[2] = afIn[6];
    afOut[3] = afIn[1]; afOut[4] = afIn[4]; afOut[5] = afIn[7];
    afOut[6] = afIn[2]; afOut[7] = afIn[5]; afOut[8] = afIn[8];
}

__global__ void misorien(float* afMisOrien, float* afM0, float* afM1, float* afSymM) {
    // Optimized kernel function for misorientation calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    float afTmp0[9];
    float afTmp1[9];
    float afM1Transpose[9];
    float fCosAngle;
    
    mat3_transpose(afM1Transpose, &afM1[blockIdx.x * 9]);
    mat3_dot(afTmp0, &afSymM[threadIdx.x * 9], afM1Transpose);
    mat3_dot(afTmp1, &afM0[blockIdx.x * 9], afTmp0);
    
    fCosAngle = 0.5f * (afTmp1[0] + afTmp1[4] + afTmp1[8] - 1);
    fCosAngle = min(0.9999999999f, fCosAngle);
    fCosAngle = max(-0.99999999999f, fCosAngle);
    
    afMisOrien[i] = acosf(fCosAngle);
}