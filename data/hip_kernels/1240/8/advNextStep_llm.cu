#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void advNextStep(double *d_prevPoint, double *d_umat, double d_stepDist, int nRxns, double *points, int pointsPerFile, int pointCount, int index) {
    // Calculate global thread index for accessing array elements
    int newindex = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop with stride to cover all elements
    for (int i = newindex; i < nRxns; i += blockDim.x * gridDim.x) {
        // Compute the next step directly and store in points array
        points[pointCount + pointsPerFile * i] = d_prevPoint[nRxns * index + i] + d_stepDist * d_umat[nRxns * index + i];
    }
}