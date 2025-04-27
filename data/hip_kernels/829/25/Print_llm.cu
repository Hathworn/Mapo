#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Print(float *beta, float *sigma, float *rho, int iter )
{
    // Loop unrolling for reduced instruction overhead.
    for (int i = 0; i < 3; ++i) {
        printf("\n %d -- %d) b %.5f -- s %.5f -- r %.5f ", iter, i + 1, beta[i], sigma[i], rho[i]);
    }
}