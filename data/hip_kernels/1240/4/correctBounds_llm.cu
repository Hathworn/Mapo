#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void correctBounds(double *d_ub, double *d_lb, int nRxns, double *d_prevPoint, double alpha, double beta, double *d_centerPoint, double *points, int pointsPerFile, int pointCount, int index) {
    // Calculate global thread index
    int newindex = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Process elements in stride to cover all nRxns
    for (int i = newindex; i < nRxns; i += stride) {
        // Use local variable to reduce global memory access
        double pointValue = points[pointCount + pointsPerFile * i];
        
        // Check bounds and correct point value
        if (pointValue > d_ub[i]) {
            pointValue = d_ub[i];
        } else if (pointValue < d_lb[i]) {
            pointValue = d_lb[i];
        }

        // Update point and store the result
        points[pointCount + pointsPerFile * i] = pointValue;
        d_prevPoint[nRxns * index + i] = pointValue;
        d_centerPoint[nRxns * index + i] = alpha * d_centerPoint[nRxns * index + i] + beta * pointValue;
    }
}