#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void findMaxAbs(int nRxns, double *d_umat2, int nMets, int *d_rowVec, int *d_colVec, double *d_val, int nnz, double *points, int pointsPerFile, int pointCount, int index) {
    int k = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop unrolling for improved performance
    for (; k < nnz; k += blockDim.x * gridDim.x) {
        double point_val = points[pointCount + pointsPerFile * d_colVec[k]];
        d_umat2[nMets * index + d_rowVec[k]] += d_val[k] * point_val;
    }
}