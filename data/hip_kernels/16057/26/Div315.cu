#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Div315(int *matrix , int *newMatrix,int nx,int ny,int Max){
int ix = blockIdx.x * blockDim.x + threadIdx.x;
int iy = blockIdx.y * blockDim.y + threadIdx.y;

int Index = iy * nx + ix;
int posisi = 0;

for(int i = 0 ; i < nx - 1 ;  ++i ){
if(Index >= i * nx && Index < ((i + 1) * nx) - 1){
posisi = matrix[Index] * nx + matrix[Index + (nx + 1)];
atomicAdd(&newMatrix[posisi],1);
printf("Index : %d %d\n",Index,Index + (nx + 1));
}
}
}