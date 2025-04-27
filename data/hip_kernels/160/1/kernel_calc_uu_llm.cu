#include "hip/hip_runtime.h"
#include "includes.h"

#define NADVANCE (4000)
#define nu (5.0e-2)

__global__ void kernel_calc_uu(double *u_dev, double *uu_dev)
{
    int j = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds to ensure we do not access memory out of range
    if(j < NADVANCE) {
        uu_dev[j] = 0.5 * u_dev[j] * u_dev[j];
    }
}