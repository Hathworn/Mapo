#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void printMat( const double *A, int size )
{
    // Use a single condition to reduce divergence
    if (blockIdx.x == 0 && threadIdx.x == 0) {
        for (int i = 0; i < size; i++) {
            printf("A[%d] = %f\n", i, A[i]);
        }
    }
} /* end printMat */