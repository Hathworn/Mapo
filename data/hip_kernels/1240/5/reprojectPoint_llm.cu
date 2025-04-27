#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reprojectPoint(double *d_N, int nRxns, int istart, double *d_umat, double *points, int pointsPerFile, int pointCount, int index){
    int newindex = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    while (newindex < nRxns - istart) {
        // Initialize d_umat element to zero
        double sum = 0.0;

        // Compute t(N) * Pt
        for (int j = 0; j < nRxns; j++) {
            sum += d_N[j + newindex * nRxns] * points[pointCount + pointsPerFile * j];
        }

        // Store the computed sum
        d_umat[nRxns * index + newindex] = sum;

        // Increment by stride for next potential index
        newindex += stride;
    }
}