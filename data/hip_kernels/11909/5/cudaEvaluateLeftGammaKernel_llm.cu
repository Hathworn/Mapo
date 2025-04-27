```c
#include "hip/hip_runtime.h"
#include "includes.h"

static unsigned int GRID_SIZE_N;
static unsigned int GRID_SIZE_4N;
static unsigned int MAX_STATE_VALUE;

__global__ static void cudaEvaluateLeftGammaKernel(int *wptr, double *x2, double *tipVector, unsigned char *tipX1, double *diagptable, double *output, const int limit) {
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= limit) {
        output[i] = 0.0;
        return;
    }

    int j;
    double term = 0.0;
    double *tipVecPtr = tipVector + 4 * tipX1[i];
    double *x2Ptr = x2 + 16 * i;
    double *diagPtr = diagptable;
    
    #pragma unroll 4  // Unroll to improve loop efficiency
    for (j = 0; j < 4; j++) {
        term += tipVecPtr[0] * x2Ptr[0] * diagPtr[0];
        term += tipVecPtr[1] * x2Ptr[1] * diagPtr[1];
        term += tipVecPtr[2] * x2Ptr[2] * diagPtr[2];
        term += tipVecPtr[3] * x2Ptr[3] * diagPtr[3];
        
        x2Ptr += 4;
        diagPtr += 4;
    }

    term = log(0.25 * fabs(term));
    output[i] = wptr[i] * term;
}