#include "hip/hip_runtime.h"
#include "includes.h"

/*This file is part of quantumsim. (https://github.com/brianzi/quantumsim)*/
/*(c) 2016 Brian Tarasinski*/
/*Distributed under the GNU GPLv3. See LICENSE.txt or https://www.gnu.org/licenses/gpl.txt*/

__global__ void trace(double *diag, int bit) {
    unsigned int x = threadIdx.x;
    unsigned int mask = (bit >= 0) ? (1 << bit) : 0;

    extern __shared__ double s_diag[];

    // Load data into shared memory
    s_diag[x] = diag[x];
    __syncthreads();

    double a = 0.0;

    // Use shared memory to avoid redundant memory access
    for (unsigned int i = 1; i < blockDim.x; i <<= 1) {
        if (i != mask && x >= i) {
            a = s_diag[x - i];
        }
        __syncthreads();
        if (i != mask && x >= i) {
            s_diag[x] += a;
        }
        __syncthreads();
    }

    // Write to global memory conditionally
    if (x == 0) {
        diag[blockIdx.x] = s_diag[blockDim.x - 1];
    } else if (x == 1 && bit >= 0) {
        diag[blockIdx.x + 1] = s_diag[blockDim.x - 1 - mask];
    }
}