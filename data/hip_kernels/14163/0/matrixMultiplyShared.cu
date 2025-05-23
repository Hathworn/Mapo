#include "hip/hip_runtime.h"
#include "includes.h"
#define Tile_size 64

int numARows = 1024;   // number of rows in the matrix A
int numAColumns = 1024;  // number of columns in the matrix A
int numBRows = 1024;   // number of rows in the matrix B
int numBColumns = 1024;  // number of columns in the matrix B
int numCRows = 1024;  // number of rows in the matrix C (you have to set this)
int numCColumns = 1024; // number of columns in the matrix C (you have to set this)


//*************************************************************
__global__ void matrixMultiplyShared(float * A, float * B, float * C, int numARows, int numAColumns, int numBRows, int numBColumns, int numCRows, int numCColumns)
{
__shared__ float sA[Tile_size][Tile_size];   // Tile size to store elements in shared memory
__shared__ float sB[Tile_size][Tile_size];

int Row = blockDim.y*blockIdx.y + threadIdx.y; //To generate ids of threads.
int Col = blockDim.x*blockIdx.x + threadIdx.x;
float Cvalue = 0.0;
sA[threadIdx.y][threadIdx.x] = 0.0;
sB[threadIdx.y][threadIdx.x] = 0.0;

for (int k = 0; k < (((numAColumns - 1)/ Tile_size) + 1); k++)
{
if ( (Row < numARows) && (threadIdx.x + (k*Tile_size)) < numAColumns)//Copy Data to Tile from Matrix (Global Memory to Shared Memory)
{
sA[threadIdx.y][threadIdx.x] = A[(Row*numAColumns) + threadIdx.x + (k*Tile_size)];
}
else
{
sA[threadIdx.y][threadIdx.x] = 0.0;
}
if ( Col < numBColumns && (threadIdx.y + k*Tile_size) < numBRows)//Copy Data to Tile from Matrix (Global Memory to Shared Memory)
{
sB[threadIdx.y][threadIdx.x] = B[(threadIdx.y + k*Tile_size)*numBColumns + Col];
}
else
{
sB[threadIdx.y][threadIdx.x] = 0.0;
}
__syncthreads();

for (int j = 0; j < Tile_size; ++j)//Multiplying Elements present in tile
{
Cvalue += sA[threadIdx.y][j] * sB[j][threadIdx.x];
}
}
if (Row < numCRows && Col < numCColumns)//Saving Final result into Matrix C
{
C[Row*numCColumns + Col] = Cvalue;
}
}