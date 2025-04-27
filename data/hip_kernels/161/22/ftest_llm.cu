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

    // Thread block out-of-bound check
    if (i >= colsy || j >= colsx) return;

    int idx = i * colsx + j;
    if (!diagFlag && i == j) {
        dfStats[idx] = 0.f;
        return;
    }

    float *tObs = obs + (i * colsx + j) * obsDim;
    float *tRCoeffs = rCoeffs + i * rCoeffsDim;
    float *tRdata = rdata + i * rdataDim;
    float *tUnrCoeffs = unrCoeffs + (i * colsx + j) * unrCoeffsDim;
    float *tUnrdata = unrdata + (i * colsx + j) * unrdataDim;

    float rSsq = 0.f, unrSsq = 0.f;
    float fp = (float)p, frows = (float)rows;

    // Unroll loop to improve performance
    for (int k = 0; k < rows; k += 2) {
        float unrEst1 = 0.f, rEst1 = 0.f, unrEst2 = 0.f, rEst2 = 0.f;
        float kobs1 = tObs[k], kobs2 = (k + 1 < rows) ? tObs[k + 1] : 0.f;

        for (int m = 0; m < rCols; m++) {
            rEst1 += tRCoeffs[m] * tRdata[k + m * rows];
            if (k + 1 < rows) rEst2 += tRCoeffs[m] * tRdata[k + 1 + m * rows];
        }
        for (int m = 0; m < unrCols; m++) {
            unrEst1 += tUnrCoeffs[m] * tUnrdata[k + m * rows];
            if (k + 1 < rows) unrEst2 += tUnrCoeffs[m] * tUnrdata[k + 1 + m * rows];
        }
        rSsq   += (kobs1 - rEst1) * (kobs1 - rEst1);
        unrSsq += (kobs1 - unrEst1) * (kobs1 - unrEst1);
        if (k + 1 < rows) {
            rSsq   += (kobs2 - rEst2) * (kobs2 - rEst2);
            unrSsq += (kobs2 - unrEst2) * (kobs2 - unrEst2);
        }
    }

    float score = ((rSsq - unrSsq) * (frows - 2.f * fp - 1.f)) / (fp * unrSsq);

    if (!isfinite(score))
        score = 0.f;

    dfStats[idx] = score;
}