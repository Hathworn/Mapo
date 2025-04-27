```c
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

__device__ void d_euler_zxz_to_mat(float* afEuler, float* afMat) {
    float s1 = sin(afEuler[0]);
    float s2 = sin(afEuler[1]);
    float s3 = sin(afEuler[2]);
    float c1 = cos(afEuler[0]);
    float c2 = cos(afEuler[1]);
    float c3 = cos(afEuler[2]);
    afMat[0] = c1 * c3 - c2 * s1 * s3;
    afMat[1] = -c1 * s3 - c3 * c2 * s1;
    afMat[2] = s1 * s2;
    afMat[3] = s1 * c3 + c2 * c1 * s3;
    afMat[4] = c1 * c2 * c3 - s1 * s3;
    afMat[5] = -c1 * s2;
    afMat[6] = s3 * s2;
    afMat[7] = s2 * c3;
    afMat[8] = c2;
}

__global__ void rand_mat_neighb_from_euler(float* afEulerIn, float* afMatOut, float* afRand, float fBound) {
    // Reduce redundant calculations by precomputing indices and offset base
    int eulerIndex = threadIdx.x * 3;
    int randIndexBase = blockIdx.x * blockDim.x * 3;
    int matIndexBase = blockIdx.x * blockDim.x * 9;
    
    // Compute afEulerTmp using cached indices
    float afEulerTmp[3];
    afEulerTmp[0] = afEulerIn[eulerIndex + 0] + (2 * afRand[randIndexBase + eulerIndex + 0] - 1) * fBound;
    afEulerTmp[2] = afEulerIn[eulerIndex + 2] + (2 * afRand[randIndexBase + eulerIndex + 2] - 1) * fBound;
    float z = cos(afEulerIn[eulerIndex + 1]) +
              (afRand[randIndexBase + eulerIndex + 1] * 2 - 1) * sin(afEulerIn[eulerIndex + 1] * fBound);
    
    // Use clamp to restrict the value of z
    afEulerTmp[1] = acosf(fminf(fmaxf(z, -1.0f), 1.0f));

    // Write output matrix using cached indices
    int matOutIndex = matIndexBase + threadIdx.x * 9;
    if (blockIdx.x > 0) {
        d_euler_zxz_to_mat(afEulerTmp, afMatOut + matOutIndex);
    } else {
        d_euler_zxz_to_mat(afEulerIn + eulerIndex, afMatOut + matOutIndex);
    }
}