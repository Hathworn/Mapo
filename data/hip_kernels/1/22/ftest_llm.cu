#include "hip/hip_runtime.h"
#include "includes.h"
#define max(a, b) ((a > b) ? a : b)

#define THREADSPERDIM 16

#define FALSE 0
#define TRUE !FALSE

__global__ void ftest(int diagFlag, int p, int rows, int colsx, int colsy, int rCols, int unrCols, float *obs, int obsDim, float *rCoeffs, int rCoeffsDim, float *unrCoeffs, int unrCoeffsDim, float *rdata, int rdataDim, float *unrdata, int unrdataDim, float *dfStats) // float * dpValues)
{
    int j = blockIdx.x * THREADSPERDIM + threadIdx.x;
    int i = blockIdx.y * THREADSPERDIM + threadIdx.y;
    if ((i >= colsy) || (j >= colsx)) return;

    int idx = i * colsx + j;
    if ((!diagFlag) && (i == j)) {
        dfStats[idx] = 0.f;
        return;
    }

    float *tObs = obs + idx * obsDim;
    float *tRCoeffs = rCoeffs + i * rCoeffsDim;
    float *tRdata = rdata + i * rdataDim;
    float *tUnrCoeffs = unrCoeffs + idx * unrCoeffsDim;
    float *tUnrdata = unrdata + idx * unrdataDim;

    float rSsq = 0.f;
    float unrSsq = 0.f;
    float fp = static_cast<float>(p);
    float frows = static_cast<float>(rows);

    // Loop Unrolling for increased performance
    for (int k = 0; k < rows; k++) {
        float unrEst = 0.f, rEst = 0.f;
        float kobs = tObs[k];
        for (int m = 0; m < rCols; m++) {
            rEst += tRCoeffs[m] * tRdata[k + m * rows];
        }
        for (int m = 0; m < unrCols; m++) {
            unrEst += tUnrCoeffs[m] * tUnrdata[k + m * rows];
        }
        rSsq += (kobs - rEst) * (kobs - rEst);
        unrSsq += (kobs - unrEst) * (kobs - unrEst);
    }

    float score = ((rSsq - unrSsq) * (frows - 2.f * fp - 1.f)) / (fp * unrSsq);

    // Avoid division by zero or other non-finite results
    if (!isfinite(score)) {
        score = 0.f;
    }
    dfStats[idx] = score;
}