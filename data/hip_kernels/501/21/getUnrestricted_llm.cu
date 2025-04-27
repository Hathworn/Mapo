```c
#include "hip/hip_runtime.h"
#include "includes.h"
#define max(a, b) ((a > b)?a:b)

#define THREADSPERDIM   16

#define FALSE 0
#define TRUE !FALSE

__global__ void getUnrestricted(int countx, int county, int rows, int cols, float * mX, int mXdim, float * vY, int vYdim, float * mQ, int mQdim, float * mR, int mRdim, float * vectB, int vectBdim) {

    int n = blockIdx.x * THREADSPERDIM + threadIdx.x;
    int m = blockIdx.y * THREADSPERDIM + threadIdx.y;
    int i, j, k;
    float sum, invnorm;
    float *X, *Y, *Q, *R, *B;
    float *coli, *colj, *colQ, *colX;
    
    if((m >= county) || (n >= countx)) return;

    X = mX + (m * countx + n) * mXdim;
    Y = vY + (m*countx+n) * vYdim;
    B = vectB + (m*countx+n) * vectBdim;
    Q = mQ + (m*countx+n) * mQdim;
    R = mR + (m*countx+n) * mRdim;

    // Unroll initialization of intercepts
    for(i = 0; i < rows; i += 4) {
        X[i] = 1.f;
        if (i + 1 < rows) X[i+1] = 1.f;
        if (i + 2 < rows) X[i+2] = 1.f;
        if (i + 3 < rows) X[i+3] = 1.f;
    }

    // Initialize Q with X ...
    for(i = 0; i < rows; i++) {
        for(j = 0; j < cols; j++)
            Q[i+j*rows] = X[i+j*rows];
    }

    // Gram-Schmidt Process to find Q
    for(j = 0; j < cols; j++) {
        colj = Q+rows*j;
        for(i = 0; i < j; i++) {
            coli = Q+rows*i;
            sum = 0.f;
            for(k = 0; k < rows; k++)
                sum += coli[k] * colj[k];

            // Use sum in a single loop for modification
            for(k = 0; k < rows; k++)
                colj[k] -= sum * coli[k];
        }
        
        sum = 0.f;
        for(i = 0; i < rows; i++)
            sum += colj[i] * colj[i];
        invnorm = 1.f / sqrtf(sum);

        // Vectorize multiplication by invnorm
        for(i = 0; i < rows; i++)
            colj[i] *= invnorm;
    }

    for(i = cols-1; i >= 0; i--) {
        colQ = Q+i*rows;
        
        // Matrix multiplication Q * X -> R
        for(j = 0; j < cols; j++) {
            colX = X+j*rows;
            sum = 0.f;
            for(k = 0; k < rows; k++)
                sum += colQ[k] * colX[k];
            R[i+j*cols] = sum;
        }
        
        sum = 0.f;
        // Compute the vector Q^t * Y -> B
        for(j = 0; j < rows; j++)
            sum += colQ[j] * Y[j];
        
        // Back substitution to find the x for Rx = B
        for(j = cols-1; j > i; j--)
            sum -= R[i+j*cols] * B[j];

        B[i] = sum / R[i+i*cols];
    }
}