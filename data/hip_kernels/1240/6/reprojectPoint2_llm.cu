#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reprojectPoint2(double *d_N, int nRxns, int istart, double *d_umat, double *points, int pointsPerFile, int pointCount, int index) {
    // Calculate the global index for the current thread
    int newindex = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Iterate through points using stride for better global memory access pattern
    for (int i = newindex; i < nRxns; i += stride) {
        // Initialize point to zero
        points[pointCount + pointsPerFile * i] = 0;
        // Use loop unrolling to improve performance
        #pragma unroll
        for (int j = 0; j < nRxns - istart; j++) {
            // Accumulate product of d_N and d_umat
            points[pointCount + pointsPerFile * i] += d_N[j * nRxns + i] * d_umat[nRxns * index + j];
        }
    }
}