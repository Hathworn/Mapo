#include "hip/hip_runtime.h"
#include "includes.h"
#define max(a, b) ((a > b)?a:b)

#define THREADSPERDIM   16

#define FALSE 0
#define TRUE !FALSE

// Kernel function optimized for performance
__global__ void getUnrestricted(int countx, int county, int rows, int cols, float * mX, int mXdim, float * vY, int vYdim, float * mQ, int mQdim, float * mR, int mRdim, float * vectB, int vectBdim) {
    
    int n = blockIdx.x * THREADSPERDIM + threadIdx.x;
    int m = blockIdx.y * THREADSPERDIM + threadIdx.y;
    if((m >= county) || (n >= countx)) return;

    float * X = mX + (m * countx + n) * mXdim;
    float * Y = vY + (m * countx + n) * vYdim;
    float * B = vectB + (m * countx + n) * vectBdim;
    float * Q = mQ + (m * countx + n) * mQdim;
    float * R = mR + (m * countx + n) * mRdim;
    
    // Initialize intercepts and Q
    for(int i = 0; i < rows; i++) {
        X[i] = 1.f;
        for(int j = 0; j < cols; j++) 
            Q[i + j * rows] = X[i + j * rows];
    }

    float *colj, *coli, sum, invnorm;
    
    // Gram-Schmidt process to find Q
    for(int j = 0; j < cols; j++) {
        colj = Q + rows * j;
        
        for(int i = 0; i < j; i++) {
            coli = Q + rows * i;
            sum = 0.f;
            for(int k = 0; k < rows; k++)
                sum += coli[k] * colj[k];
            for(int k = 0; k < rows; k++)
                colj[k] -= sum * coli[k];
        }
        
        sum = 0.f;
        for(int i = 0; i < rows; i++)
            sum += colj[i] * colj[i];
        invnorm = rsqrtf(sum); // Utilize rsqrt for optimized inversion
        for(int i = 0; i < rows; i++)
            colj[i] *= invnorm;
    }

    // Back substitution to solve Rx = B
    for(int i = cols - 1; i > -1; i--) {
        float * colQ = Q + i * rows;
        
        // Compute R = Q^t * X
        for(int j = 0; j < cols; j++) {
            float * colX = X + j * rows;
            sum = 0.f;
            for(int k = 0; k < rows; k++)
                sum += colQ[k] * colX[k];
            R[i + j * cols] = sum;
        }
        
        sum = 0.f;
        // Compute Q^t * Y -> B
        for(int j = 0; j < rows; j++)
            sum += colQ[j] * Y[j];
        
        // Back substitution to find the solution
        for(int j = cols - 1; j > i; j--)
            sum -= R[i + j * cols] * B[j];
        
        B[i] = sum / R[i + i * cols];
    }
}