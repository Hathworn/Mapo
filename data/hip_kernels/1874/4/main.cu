#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <hiprand_kernel.h>
#include <stdlib.h>
#include <hip/hip_runtime.h>
#include <sys/time.h>
#include "RoeStep.cu"
#include<chrono>
#include<iostream>
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
const int nbrOfGrids = 1;
double *d_u1 = NULL;
hipMalloc(&d_u1, XSIZE*YSIZE);
double *d_u2 = NULL;
hipMalloc(&d_u2, XSIZE*YSIZE);
double *d_u3 = NULL;
hipMalloc(&d_u3, XSIZE*YSIZE);
const double *d_vol = NULL;
hipMalloc(&d_vol, XSIZE*YSIZE);
double *d_f1 = NULL;
hipMalloc(&d_f1, XSIZE*YSIZE);
double *d_f2 = NULL;
hipMalloc(&d_f2, XSIZE*YSIZE);
double *d_f3 = NULL;
hipMalloc(&d_f3, XSIZE*YSIZE);
const double *d_tau = NULL;
hipMalloc(&d_tau, XSIZE*YSIZE);
const double *d_h = NULL;
hipMalloc(&d_h, XSIZE*YSIZE);
const double *d_gama = NULL;
hipMalloc(&d_gama, XSIZE*YSIZE);
double *w1 = NULL;
hipMalloc(&w1, XSIZE*YSIZE);
double *w2 = NULL;
hipMalloc(&w2, XSIZE*YSIZE);
double *w3 = NULL;
hipMalloc(&w3, XSIZE*YSIZE);
double *w4 = NULL;
hipMalloc(&w4, XSIZE*YSIZE);
double *fc1 = NULL;
hipMalloc(&fc1, XSIZE*YSIZE);
double *fc2 = NULL;
hipMalloc(&fc2, XSIZE*YSIZE);
double *fc3 = NULL;
hipMalloc(&fc3, XSIZE*YSIZE);
double *fr1 = NULL;
hipMalloc(&fr1, XSIZE*YSIZE);
double *fr2 = NULL;
hipMalloc(&fr2, XSIZE*YSIZE);
double *fr3 = NULL;
hipMalloc(&fr3, XSIZE*YSIZE);
double *fl1 = NULL;
hipMalloc(&fl1, XSIZE*YSIZE);
double *fl2 = NULL;
hipMalloc(&fl2, XSIZE*YSIZE);
double *fl3 = NULL;
hipMalloc(&fl3, XSIZE*YSIZE);
double *fludif1 = NULL;
hipMalloc(&fludif1, XSIZE*YSIZE);
double *fludif2 = NULL;
hipMalloc(&fludif2, XSIZE*YSIZE);
double *fludif3 = NULL;
hipMalloc(&fludif3, XSIZE*YSIZE);
double *rsumr = NULL;
hipMalloc(&rsumr, XSIZE*YSIZE);
double *utilde = NULL;
hipMalloc(&utilde, XSIZE*YSIZE);
double *htilde = NULL;
hipMalloc(&htilde, XSIZE*YSIZE);
double *uvdif = NULL;
hipMalloc(&uvdif, XSIZE*YSIZE);
double *absvt = NULL;
hipMalloc(&absvt, XSIZE*YSIZE);
double *ssc = NULL;
hipMalloc(&ssc, XSIZE*YSIZE);
double *vsc = NULL;
hipMalloc(&vsc, XSIZE*YSIZE);
double *eiglam1 = NULL;
hipMalloc(&eiglam1, XSIZE*YSIZE);
double *eiglam2 = NULL;
hipMalloc(&eiglam2, XSIZE*YSIZE);
double *eiglam3 = NULL;
hipMalloc(&eiglam3, XSIZE*YSIZE);
double *sgn1 = NULL;
hipMalloc(&sgn1, XSIZE*YSIZE);
double *sgn2 = NULL;
hipMalloc(&sgn2, XSIZE*YSIZE);
double *sgn3 = NULL;
hipMalloc(&sgn3, XSIZE*YSIZE);
int *isb1 = NULL;
hipMalloc(&isb1, XSIZE*YSIZE);
int *isb2 = NULL;
hipMalloc(&isb2, XSIZE*YSIZE);
int *isb3 = NULL;
hipMalloc(&isb3, XSIZE*YSIZE);
double *a1 = NULL;
hipMalloc(&a1, XSIZE*YSIZE);
double *a2 = NULL;
hipMalloc(&a2, XSIZE*YSIZE);
double *a3 = NULL;
hipMalloc(&a3, XSIZE*YSIZE);
double *ac11 = NULL;
hipMalloc(&ac11, XSIZE*YSIZE);
double *ac12 = NULL;
hipMalloc(&ac12, XSIZE*YSIZE);
double *ac13 = NULL;
hipMalloc(&ac13, XSIZE*YSIZE);
double *ac21 = NULL;
hipMalloc(&ac21, XSIZE*YSIZE);
double *ac22 = NULL;
hipMalloc(&ac22, XSIZE*YSIZE);
double *ac23 = NULL;
hipMalloc(&ac23, XSIZE*YSIZE);
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
RoeStep<<<gridBlock,threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_vol,d_f1,d_f2,d_f3,d_tau,d_h,d_gama,w1,w2,w3,w4,fc1,fc2,fc3,fr1,fr2,fr3,fl1,fl2,fl3,fludif1,fludif2,fludif3,rsumr,utilde,htilde,uvdif,absvt,ssc,vsc,eiglam1,eiglam2,eiglam3,sgn1,sgn2,sgn3,isb1,isb2,isb3,a1,a2,a3,ac11,ac12,ac13,ac21,ac22,ac23);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 10; ++loop_counter) {
RoeStep<<<gridBlock,threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_vol,d_f1,d_f2,d_f3,d_tau,d_h,d_gama,w1,w2,w3,w4,fc1,fc2,fc3,fr1,fr2,fr3,fl1,fl2,fl3,fludif1,fludif2,fludif3,rsumr,utilde,htilde,uvdif,absvt,ssc,vsc,eiglam1,eiglam2,eiglam3,sgn1,sgn2,sgn3,isb1,isb2,isb3,a1,a2,a3,ac11,ac12,ac13,ac21,ac22,ac23);
}
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 1000; loop_counter++) {
RoeStep<<<gridBlock,threadBlock>>>(nbrOfGrids,d_u1,d_u2,d_u3,d_vol,d_f1,d_f2,d_f3,d_tau,d_h,d_gama,w1,w2,w3,w4,fc1,fc2,fc3,fr1,fr2,fr3,fl1,fl2,fl3,fludif1,fludif2,fludif3,rsumr,utilde,htilde,uvdif,absvt,ssc,vsc,eiglam1,eiglam2,eiglam3,sgn1,sgn2,sgn3,isb1,isb2,isb3,a1,a2,a3,ac11,ac12,ac13,ac21,ac22,ac23);
}
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period> >(end - start);
cout <<'['<<usecs.count()<<','<<'('<<BLOCKX<<','<<BLOCKY<<')' << ','<<'('<<XSIZE<<','<<YSIZE<<')'<<']' << endl;
}
}}