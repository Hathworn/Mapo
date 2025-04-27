#include "hip/hip_runtime.h"
#include "includes.h"
#define max(a, b) ((a > b)?a:b)

#define THREADSPERDIM   16

#define FALSE 0
#define TRUE !FALSE

__global__ void getUnrestricted(int countx, int county, int rows, int cols, float *mX, int mXdim, float *vY, int vYdim, float *mQ, int mQdim, float *mR, int mRdim, float *vectB, int vectBdim) {
    int n = blockIdx.x * THREADSPERDIM + threadIdx.x;
    int m = blockIdx.y * THREADSPERDIM + threadIdx.y;
    if ((m >= county) || (n >= countx)) return;

    float* X = mX + (m * countx + n) * mXdim;
    float* Y = vY + (m * countx + n) * vYdim;
    float* Q = mQ + (m * countx + n) * mQdim;
    float* R = mR + (m * countx + n) * mRdim;
    float* B = vectB + (m * countx + n) * vectBdim;

    // Initialize the intercepts
    for (int i = 0; i < rows; i++) {
        X[i] = 1.f;
    }

    // Initialize Q with X ...
    for (int j = 0; j < cols; j++) {
        for (int i = 0; i < rows; i++) {
            Q[i + j * rows] = X[i + j * rows];
        }
    }

    // Gram-Schmidt process to find Q
    for (int j = 0; j < cols; j++) {
        float* colj = Q + rows * j;
        for (int i = 0; i < j; i++) {
            float* coli = Q + rows * i;
            float sum = 0.f;
            for (int k = 0; k < rows; k++) {
                sum += coli[k] * colj[k];
            }
            for (int k = 0; k < rows; k++) {
                colj[k] -= sum * coli[k];
            }
        }
        float sum = 0.f;
        for (int i = 0; i < rows; i++) {
            sum += colj[i] * colj[i];
        }
        float invnorm = 1.f / sqrtf(sum);
        for (int i = 0; i < rows; i++) {
            colj[i] *= invnorm;
        }
    }

    // Back substitution process
    for (int i = cols - 1; i > -1; i--) {
        float* colQ = Q + i * rows;
        // Matrix multiplication Q * X -> R
        for (int j = 0; j < cols; j++) {
            float* colX = X + j * rows;
            float sum = 0.f;
            for (int k = 0; k < rows; k++) {
                sum += colQ[k] * colX[k];
            }
            R[i + j * cols] = sum;
        }
        float sum = 0.f;
        // Compute the vector Q^t * Y -> B
        for (int j = 0; j < rows; j++) {
            sum += colQ[j] * Y[j];
        }
        // Back substitution to find the x for Rx = B
        for (int j = cols - 1; j > i; j--) {
            sum -= R[i + j * cols] * B[j];
        }
        B[i] = sum / R[i + i * cols];
    }
}