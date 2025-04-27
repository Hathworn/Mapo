```c
#include "hip/hip_runtime.h"
#include "includes.h"
#define max(a, b) ((a > b)?a:b)

#define THREADSPERDIM   16

#define FALSE 0
#define TRUE !FALSE

__global__ void ftest(int diagFlag, int p, int rows, int colsx, int colsy, int rCols, int unrCols, float * obs, int obsDim, float * rCoeffs, int rCoeffsDim, float * unrCoeffs, int unrCoeffsDim, float * rdata, int rdataDim, float * unrdata, int unrdataDim, float * dfStats) 
{
    int j = blockIdx.x * THREADSPERDIM + threadIdx.x;
    int i = blockIdx.y * THREADSPERDIM + threadIdx.y;
    int idx = i * colsx + j;

    if ((i >= colsy) || (j >= colsx)) return;
    if ((!diagFlag) && (i == j)) {
        dfStats[idx] = 0.f;
        return;
    }

    float kobs, fp = (float)p, frows = (float)rows, rSsq = 0.f, unrSsq = 0.f, rEst, unrEst, score = 0.f;
    
    // Pre-calculate row indices
    float* tObs = obs + (i * colsx + j) * obsDim;
    float* tRCoeffs = rCoeffs + i * rCoeffsDim;
    float* tRdata = rdata + i * rdataDim;
    float* tUnrCoeffs = unrCoeffs + (i * colsx + j) * unrCoeffsDim;
    float* tUnrdata = unrdata + (i * colsx + j) * unrdataDim;

    // Optimize loop by minimizing calculations inside loops
    for (int k = 0; k < rows; ++k) {
        rEst = 0.f;
        unrEst = 0.f;
        kobs = tObs[k];

        // Unroll inner loops
        for (int m = 0; m < rCols; ++m) {
            rEst += tRCoeffs[m] * tRdata[k + m * rows];
        }
        for (int m = 0; m < unrCols; ++m) {
            unrEst += tUnrCoeffs[m] * tUnrdata[k + m * rows];
        }

        rSsq += (kobs - rEst) * (kobs - rEst);
        unrSsq += (kobs - unrEst) * (kobs - unrEst);
    }

    score = ((rSsq - unrSsq) * (frows - 2.f * fp - 1.f)) / (fp * unrSsq);

    if (!isfinite(score)) {
        score = 0.f;
    }

    dfStats[idx] = score;
}