#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update2(float *alphaMinusBeta_out, const float *rho, const float *yDotZ, const float *alpha)
{
    // Use shared memory to minimize global memory access latency
    __shared__ float shared_rho;
    __shared__ float shared_yDotZ;
    __shared__ float shared_alpha;

    // Load the variables into shared memory
    if (threadIdx.x == 0) {
        shared_rho = *rho;
        shared_yDotZ = *yDotZ;
        shared_alpha = *alpha;
    }
    __syncthreads();

    // Compute beta using shared memory
    const float beta = shared_rho * shared_yDotZ;

    // Calculate alphaMinusBeta using shared memory
    *alphaMinusBeta_out = shared_alpha - beta;
}