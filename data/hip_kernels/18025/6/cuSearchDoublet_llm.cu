#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuSearchDoublet(const int* nSpM, const float* spMmat, const int* nSpB, const float* spBmat, const int* nSpT, const float* spTmat, const float* deltaRMin, const float* deltaRMax, const float* cotThetaMax, const float* collisionRegionMin, const float* collisionRegionMax, int*  nSpMcomp, int*  nSpBcompPerSpM_Max, int*  nSpTcompPerSpM_Max, int*  nSpBcompPerSpM, int*  nSpTcompPerSpM, int*  McompIndex, int*  BcompIndex, int*  tmpBcompIndex, int*  TcompIndex, int*  tmpTcompIndex ){

extern __shared__ float sharedMem[];
int* mPos      = (int*)sharedMem;
int* isMcompat = (int*)&mPos[1];

if (threadIdx.x==0) {
*isMcompat = false;
}
__syncthreads();

float rM = spMmat[blockIdx.x +(*nSpM)*3];
float zM = spMmat[blockIdx.x +(*nSpM)*2];

bool isBcompat, isTcompat;
int offset = threadIdx.x; // Initialize offset with threadIdx.x to avoid using separate offset varaible later.

while (offset < max(*nSpB, *nSpT)){

isBcompat = false;
isTcompat = false;

// Doublet search for bottom hits
if (offset < *nSpB ){
    float rB = spBmat[offset+(*nSpB)*3];
    float zB = spBmat[offset+(*nSpB)*2];
    float deltaR = rM - rB;
    float cotTheta = (zM - zB)/deltaR;

    if(deltaR <= *deltaRMax && deltaR >= *deltaRMin && fabsf(cotTheta) <= *cotThetaMax){
        float zOrigin = zM - rM*cotTheta;
        if (zOrigin >= *collisionRegionMin && zOrigin <= *collisionRegionMax) {
            isBcompat = true;
        }
    }

    if (isBcompat) {
        int bPos = atomicAdd(&nSpBcompPerSpM[blockIdx.x], 1);
        tmpBcompIndex[bPos+(*nSpB)*blockIdx.x] = offset;
    }
}

// Doublet search for top hits
if (offset < *nSpT){
    float rT = spTmat[offset+(*nSpT)*3];
    float zT = spTmat[offset+(*nSpT)*2];
    float deltaR = rT - rM;
    float cotTheta = (zT - zM)/deltaR;

    if (deltaR >= *deltaRMin && deltaR <= *deltaRMax && fabsf(cotTheta) <= *cotThetaMax){
        float zOrigin = zM - rM*cotTheta;
        if (zOrigin >= *collisionRegionMin && zOrigin <= *collisionRegionMax) {
            isTcompat = true;
        }
    }

    if (isTcompat){
        int tPos = atomicAdd(&nSpTcompPerSpM[blockIdx.x], 1);
        tmpTcompIndex[tPos+(*nSpT)*blockIdx.x] = offset;
    }
}

offset += blockDim.x; // Increment offset by blockDim.x
}

__syncthreads();

if (threadIdx.x == 0){
if (nSpBcompPerSpM[blockIdx.x] > 0 && nSpTcompPerSpM[blockIdx.x] > 0 ){
*mPos = atomicAdd(nSpMcomp,1);
*isMcompat = true;
McompIndex[*mPos] = blockIdx.x;

atomicMax(nSpBcompPerSpM_Max, nSpBcompPerSpM[blockIdx.x]);
atomicMax(nSpTcompPerSpM_Max, nSpTcompPerSpM[blockIdx.x]);
}
}

__syncthreads();

if (*isMcompat){
offset = threadIdx.x;

while(offset < max(nSpBcompPerSpM[blockIdx.x], nSpTcompPerSpM[blockIdx.x] ) ){

if (offset < nSpBcompPerSpM[blockIdx.x]){
BcompIndex[offset+(*nSpB)*(*mPos)]
= tmpBcompIndex[offset+(*nSpB)*blockIdx.x];
}

if (offset < nSpTcompPerSpM[blockIdx.x]){
TcompIndex[offset+(*nSpT)*(*mPos)]
= tmpTcompIndex[offset+(*nSpT)*blockIdx.x];
}
offset += blockDim.x;
}
}

}