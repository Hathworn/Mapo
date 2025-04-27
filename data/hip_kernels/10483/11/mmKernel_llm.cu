#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void mmKernel(float* popsIn, float* popsOut, float* mmm, int patches) {
    int ii = threadIdx.x;

    if (ii < patches) {
        extern __shared__ float s[];

        s[ii] = 0.0;
        
        // Use unrolled loop for increased performance
        for (int jj = 0; jj < patches; jj += 4) {
            s[ii] += popsIn[ii] * mmm[ii * patches + jj];
            if (jj + 1 < patches) s[ii] += popsIn[ii] * mmm[ii * patches + jj + 1];
            if (jj + 2 < patches) s[ii] += popsIn[ii] * mmm[ii * patches + jj + 2];
            if (jj + 3 < patches) s[ii] += popsIn[ii] * mmm[ii * patches + jj + 3];
        }
        
        __syncthreads();
        popsOut[ii] = s[ii];
    }
}