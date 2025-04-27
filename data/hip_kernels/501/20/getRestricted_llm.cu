#include "hip/hip_runtime.h"
#include "includes.h"
#define max(a, b) ((a > b)?a:b)

#define THREADSPERDIM   16

#define FALSE 0
#define TRUE !FALSE

// mX has order rows x cols
// vectY has length rows

__global__ void getRestricted(int countx, int county, int rows, int cols, float * mX, int mXdim, float * vY, int vYdim, float * mQ, int mQdim, float * mR, int mRdim, float * vectB, int vectBdim) {

    int m = blockIdx.x * THREADSPERDIM + threadIdx.x;
    if (m >= county) return;

    int n = (m == 1) ? 0 : 1;

    float *X = mX + (m * mXdim);
    float *Y = vY + (m * countx + n) * vYdim;
    float *B = vectB + m * vectBdim;
    float *Q = mQ + m * mQdim;
    float *R = mR + m * mRdim;

    // Initialize intercepts
    for (int i = 0; i < rows; i++) 
        X[i] = 1.f;

    // Initialize Q with X
    for (int i = 0; i < rows; i++) {
#pragma unroll
        for (int j = 0; j < cols; j++)
            Q[i + j * rows] = X[i + j * rows];
    }

    // Gram-Schmidt process to find Q
    for (int j = 0; j < cols; j++) {
        float *colj = Q + rows * j;
        for (int i = 0; i < j; i++) {
            float *coli = Q + rows * i;
            float sum = 0.f;

            // Sum = dot product of coli and colj
            for (int k = 0; k < rows; k++) 
                sum += coli[k] * colj[k];
            
            for (int k = 0; k < rows; k++)
                colj[k] -= sum * coli[k];
        }
        // Normalize colj
        float sum = 0.f;
        for (int i = 0; i < rows; i++)
            sum += colj[i] * colj[i];
        float invnorm = 1.f / sqrtf(sum);
        for (int i = 0; i < rows; i++)
            colj[i] *= invnorm;
    }

    // Matrix multiplication Q * X -> R and QR decomposition
    for (int i = cols - 1; i >= 0; i--) {
        float *colQ = Q + i * rows;
        for (int j = 0; j < cols; j++) {
            float *colX = X + j * rows;
            float sum = 0.f;
            // Sum = dot product of colQ and colX
            for (int k = 0; k < rows; k++)
                sum += colQ[k] * colX[k];
            R[i + j * cols] = sum;
        }
        float sum = 0.f;
        // Compute vector Q^t * Y -> B
        for (int j = 0; j < rows; j++)
            sum += colQ[j] * Y[j];
        // Back substitution for Rx = B
        for (int j = cols - 1; j > i; j--)
            sum -= R[i + j * cols] * B[j];
        
        B[i] = sum / R[i + i * cols];
    }
}