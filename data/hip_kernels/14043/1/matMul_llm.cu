```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matMul(float *A, int l_A, int c_A, float *B, int l_B, int c_B, float *C, int l_C, int c_C)
{
    float resultat = 0.0;
    int ligne = blockIdx.x * blockDim.x + threadIdx.x;
    int colonne = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within matrix bounds
    if(ligne < l_A && colonne < c_B) 
    {
        // Compute matrix multiplication
        for(int i = 0; i < c_A; i++)
        {
            resultat += A[ligne * c_A + i] * B[i * c_B + colonne];
        }
        C[ligne * c_C + colonne] = resultat;
    }
}