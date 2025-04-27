#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuSearchDoublet(const int* nSpM, const float* spMmat, const int* nSpB, const float* spBmat, const int* nSpT, const float* spTmat, const float* deltaRMin, const float* deltaRMax, const float* cotThetaMax, const float* collisionRegionMin, const float* collisionRegionMax, int* nSpMcomp, int* nSpBcompPerSpM_Max, int* nSpTcompPerSpM_Max, int* nSpBcompPerSpM, int* nSpTcompPerSpM, int* McompIndex, int* BcompIndex, int* tmpBcompIndex, int* TcompIndex, int* tmpTcompIndex) {
    extern __shared__ float sharedMem[];
    int* mPos = (int*)sharedMem;
    int* isMcompat = (int*)&mPos[1];

    if (threadIdx.x == 0) {
        *isMcompat = false;
    }
    __syncthreads();

    float rM = spMmat[blockIdx.x + (*nSpM) * 3];
    float zM = spMmat[blockIdx.x + (*nSpM) * 2];

    int offset = 0;
    const int nSpB_val = *nSpB;
    const int nSpT_val = *nSpT;
    const float deltaRMin_val = *deltaRMin;
    const float deltaRMax_val = *deltaRMax;
    const float cotThetaMax_val = *cotThetaMax;
    const float collisionRegionMin_val = *collisionRegionMin;
    const float collisionRegionMax_val = *collisionRegionMax;

    while (offset < max(nSpB_val, nSpT_val)) {
        if (threadIdx.x + offset < nSpB_val) {
            float rB = spBmat[threadIdx.x + offset + nSpB_val * 3];
            float zB = spBmat[threadIdx.x + offset + nSpB_val * 2];
            float deltaR = rM - rB;
            bool isBcompat = (deltaR <= deltaRMax_val && deltaR >= deltaRMin_val);
            float cotTheta = (zM - zB) / deltaR;
            isBcompat &= (fabsf(cotTheta) <= cotThetaMax_val);
            float zOrigin = zM - rM * cotTheta;
            isBcompat &= (zOrigin >= collisionRegionMin_val && zOrigin <= collisionRegionMax_val);

            if (isBcompat) {
                int bPos = atomicAdd(&nSpBcompPerSpM[blockIdx.x], 1);
                tmpBcompIndex[bPos + nSpB_val * blockIdx.x] = threadIdx.x + offset;
            }
        }

        if (threadIdx.x + offset < nSpT_val) {
            float rT = spTmat[threadIdx.x + offset + nSpT_val * 3];
            float zT = spTmat[threadIdx.x + offset + nSpT_val * 2];
            float deltaR = rT - rM;
            bool isTcompat = (deltaR >= deltaRMin_val && deltaR <= deltaRMax_val);
            float cotTheta = (zT - zM) / deltaR;
            isTcompat &= (fabsf(cotTheta) <= cotThetaMax_val);
            float zOrigin = zM - rM * cotTheta;
            isTcompat &= (zOrigin >= collisionRegionMin_val && zOrigin <= collisionRegionMax_val);

            if (isTcompat) {
                int tPos = atomicAdd(&nSpTcompPerSpM[blockIdx.x], 1);
                tmpTcompIndex[tPos + nSpT_val * blockIdx.x] = threadIdx.x + offset;
            }
        }

        offset += blockDim.x;
    }

    __syncthreads();

    if (threadIdx.x == 0) {
        if (nSpBcompPerSpM[blockIdx.x] > 0 && nSpTcompPerSpM[blockIdx.x] > 0) {
            *mPos = atomicAdd(nSpMcomp, 1);
            *isMcompat = true;
            McompIndex[*mPos] = blockIdx.x;

            atomicMax(nSpBcompPerSpM_Max, nSpBcompPerSpM[blockIdx.x]);
            atomicMax(nSpTcompPerSpM_Max, nSpTcompPerSpM[blockIdx.x]);
        }
    }

    __syncthreads();

    if (*isMcompat == true) {
        offset = 0;
        const int nSpBcomp = nSpBcompPerSpM[blockIdx.x];
        const int nSpTcomp = nSpTcompPerSpM[blockIdx.x];
        while (offset < max(nSpBcomp, nSpTcomp)) {
            if (threadIdx.x + offset < nSpBcomp) {
                BcompIndex[threadIdx.x + offset + nSpB_val * (*mPos)] = tmpBcompIndex[threadIdx.x + offset + nSpB_val * blockIdx.x];
            }
            if (threadIdx.x + offset < nSpTcomp) {
                TcompIndex[threadIdx.x + offset + nSpT_val * (*mPos)] = tmpTcompIndex[threadIdx.x + offset + nSpT_val * blockIdx.x];
            }
            offset += blockDim.x;
        }
    }
}