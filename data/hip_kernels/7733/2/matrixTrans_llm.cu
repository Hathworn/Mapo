#include "hip/hip_runtime.h"
#include "includes.h"
//Library Definition

//Constant Definition
#define PI 3.141592654
#define blocksize 32
#define Repetitions 8192

//Print matrix into standard output
void print(double * M, int cols, int rows);
void dot(double * a, double * b, double & c, int cols);
void Create_New_Matrix(double * M, double * New, int * vec, int p0, int pp, int nn);

/*
DEVICE FUNCTIONS
*/

//Matrix transposition (Rows and Cols of M)

__global__ void matrixTrans(double * M, double * MT, int rows, int cols)
{
    int col = blockIdx.y * blockDim.y + threadIdx.y;
    int row = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that threads do not go out of bounds
    if (row < rows && col < cols) 
    {
        // Coalesced memory access for better performance
        int input_idx = col + row * cols;
        int output_idx = row + col * rows;
        MT[output_idx] = M[input_idx];
    }
}