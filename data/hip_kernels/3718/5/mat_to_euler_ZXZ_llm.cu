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

__global__ void mat_to_euler_ZXZ(float* afMatIn, float* afEulerOut, int iNAngle) {
    /*
    * transform active rotation matrix to euler angles in ZXZ convention, not right(seems right now)
    * afMatIn: iNAngle * 9
    * afEulerOut: iNAngle* 3
    * TEST PASSED
    */
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    float threshold = 0.9999999;
    
    if (i < iNAngle) {
        float m22 = afMatIn[i * 9 + 8];
        if (m22 > threshold) {
            // Handle special case when m[2, 2] is near 1
            afEulerOut[i * 3 + 0] = 0;
            afEulerOut[i * 3 + 1] = 0;
            afEulerOut[i * 3 + 2] = atan2(afMatIn[i * 9 + 3], afMatIn[i * 9]); 
        } else if (m22 < -threshold) {
            // Handle special case when m[2, 2] is near -1
            afEulerOut[i * 3 + 0] = 0;
            afEulerOut[i * 3 + 1] = PI;
            afEulerOut[i * 3 + 2] = atan2(afMatIn[i * 9 + 1], afMatIn[i * 9]);
        } else {
            // General case
            float m20 = afMatIn[i * 9 + 6];
            float m21 = afMatIn[i * 9 + 7];
            float m12 = afMatIn[i * 9 + 5];
            float atan20 = atan2(m20, m21); 

            afEulerOut[i * 3 + 0] = atan2(afMatIn[i * 9 + 2], -m12);
            afEulerOut[i * 3 + 1] = atan2(sqrt(m20 * m20 + m21 * m21), m22);
            afEulerOut[i * 3 + 2] = atan20;

            // Ensure all angles are positive
            if (afEulerOut[i * 3 + 0] < 0) afEulerOut[i * 3 + 0] += 2 * PI;
            if (afEulerOut[i * 3 + 1] < 0) afEulerOut[i * 3 + 1] += 2 * PI;
            if (afEulerOut[i * 3 + 2] < 0) afEulerOut[i * 3 + 2] += 2 * PI;
        }
    }
}