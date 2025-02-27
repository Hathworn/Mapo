#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "cuSearchDoublet.cu"
#include <chrono>
#include <iostream>
using namespace std;
using namespace std::chrono;
int blocks_[20][2] = {{8,8},{16,16},{24,24},{32,32},{1,64},{1,128},{1,192},{1,256},{1,320},{1,384},{1,448},{1,512},{1,576},{1,640},{1,704},{1,768},{1,832},{1,896},{1,960},{1,1024}};
int matrices_[7][2] = {{240,240},{496,496},{784,784},{1016,1016},{1232,1232},{1680,1680},{2024,2024}};
int main(int argc, char **argv) {
hipSetDevice(0);
char* p;int matrix_len=strtol(argv[1], &p, 10);
for(int matrix_looper=0;matrix_looper<matrix_len;matrix_looper++){
for(int block_looper=0;block_looper<20;block_looper++){
int XSIZE=matrices_[matrix_looper][0],YSIZE=matrices_[matrix_looper][1],BLOCKX=blocks_[block_looper][0],BLOCKY=blocks_[block_looper][1];
const int *nSpM = NULL;
hipMalloc(&nSpM, XSIZE*YSIZE);
const float *spMmat = NULL;
hipMalloc(&spMmat, XSIZE*YSIZE);
const int *nSpB = NULL;
hipMalloc(&nSpB, XSIZE*YSIZE);
const float *spBmat = NULL;
hipMalloc(&spBmat, XSIZE*YSIZE);
const int *nSpT = NULL;
hipMalloc(&nSpT, XSIZE*YSIZE);
const float *spTmat = NULL;
hipMalloc(&spTmat, XSIZE*YSIZE);
const float *deltaRMin = NULL;
hipMalloc(&deltaRMin, XSIZE*YSIZE);
const float *deltaRMax = NULL;
hipMalloc(&deltaRMax, XSIZE*YSIZE);
const float *cotThetaMax = NULL;
hipMalloc(&cotThetaMax, XSIZE*YSIZE);
const float *collisionRegionMin = NULL;
hipMalloc(&collisionRegionMin, XSIZE*YSIZE);
const float *collisionRegionMax = NULL;
hipMalloc(&collisionRegionMax, XSIZE*YSIZE);
int *nSpMcomp = NULL;
hipMalloc(&nSpMcomp, XSIZE*YSIZE);
int *nSpBcompPerSpM_Max = NULL;
hipMalloc(&nSpBcompPerSpM_Max, XSIZE*YSIZE);
int *nSpTcompPerSpM_Max = NULL;
hipMalloc(&nSpTcompPerSpM_Max, XSIZE*YSIZE);
int *nSpBcompPerSpM = NULL;
hipMalloc(&nSpBcompPerSpM, XSIZE*YSIZE);
int *nSpTcompPerSpM = NULL;
hipMalloc(&nSpTcompPerSpM, XSIZE*YSIZE);
int *McompIndex = NULL;
hipMalloc(&McompIndex, XSIZE*YSIZE);
int *BcompIndex = NULL;
hipMalloc(&BcompIndex, XSIZE*YSIZE);
int *tmpBcompIndex = NULL;
hipMalloc(&tmpBcompIndex, XSIZE*YSIZE);
int *TcompIndex = NULL;
hipMalloc(&TcompIndex, XSIZE*YSIZE);
int *tmpTcompIndex = NULL;
hipMalloc(&tmpTcompIndex, XSIZE*YSIZE);
int iXSIZE= XSIZE;
int iYSIZE= YSIZE;
while(iXSIZE%BLOCKX!=0)
{
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0)
{
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
cuSearchDoublet<<<gridBlock,threadBlock>>>(nSpM,spMmat,nSpB,spBmat,nSpT,spTmat,deltaRMin,deltaRMax,cotThetaMax,collisionRegionMin,collisionRegionMax,nSpMcomp,nSpBcompPerSpM_Max,nSpTcompPerSpM_Max,nSpBcompPerSpM,nSpTcompPerSpM,McompIndex,BcompIndex,tmpBcompIndex,TcompIndex,tmpTcompIndex);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
cuSearchDoublet<<<gridBlock,threadBlock>>>(nSpM,spMmat,nSpB,spBmat,nSpT,spTmat,deltaRMin,deltaRMax,cotThetaMax,collisionRegionMin,collisionRegionMax,nSpMcomp,nSpBcompPerSpM_Max,nSpTcompPerSpM_Max,nSpBcompPerSpM,nSpTcompPerSpM,McompIndex,BcompIndex,tmpBcompIndex,TcompIndex,tmpTcompIndex);
}
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
cuSearchDoublet<<<gridBlock,threadBlock>>>(nSpM,spMmat,nSpB,spBmat,nSpT,spTmat,deltaRMin,deltaRMax,cotThetaMax,collisionRegionMin,collisionRegionMax,nSpMcomp,nSpBcompPerSpM_Max,nSpTcompPerSpM_Max,nSpBcompPerSpM,nSpTcompPerSpM,McompIndex,BcompIndex,tmpBcompIndex,TcompIndex,tmpTcompIndex);
}
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period> >(end - start);
cout <<'['<<usecs.count()<<','<<'('<<BLOCKX<<','<<BLOCKY<<')' << ','<<'('<<XSIZE<<','<<YSIZE<<')'<<']' << endl;
}
}}