#include "hip/hip_runtime.h"
#include "includes.h"

// Define constants for better readability and potential reuse
#define THREADS_PER_BLOCK CUDA_BLOCK_SIZE
#define GRID_SIZE CUDA_GRID_SIZE

__global__ void HydroComputedUz_CUDA3_kernel(float *FluxD, float *FluxS1, float *FluxS2, float *FluxS3, float *FluxTau, float *dUD, float *dUS1, float *dUS2, float *dUS3, float *dUTau, float dtdx, int size, int dim0, int dim1, int dim2)
{
    // Calculate global index
    const long igridz = threadIdx.x + blockIdx.x * THREADS_PER_BLOCK + blockIdx.y * THREADS_PER_BLOCK * GRID_SIZE;

    if (igridz >= 2 && igridz <= size - 3)
    {
        // Precompute reused values
        const int dim0_dim2 = dim0 * dim2;
        const int j = igridz / dim0_dim2;
        const int temp = igridz - j * dim0_dim2;
        const int i = temp / dim2;
        const int k = temp - i * dim2;
        const int igrid = i + (j + k * dim1) * dim0;

        const int igridzp1 = igridz + 1;
        const int j_p1 = igridzp1 / dim0_dim2;
        const int temp_p1 = igridzp1 - j_p1 * dim0_dim2;
        const int i_p1 = temp_p1 / dim2;
        const int k_p1 = temp_p1 - i_p1 * dim2;
        const int igridp1 = i_p1 + (j_p1 + k_p1 * dim1) * dim0;

        // Perform the computation
        const float multiplier = dtdx;
        dUD[igrid] += (FluxD[igrid] - FluxD[igridp1]) * multiplier;
        dUS1[igrid] += (FluxS1[igrid] - FluxS1[igridp1]) * multiplier;
        dUS2[igrid] += (FluxS2[igrid] - FluxS2[igridp1]) * multiplier;
        dUS3[igrid] += (FluxS3[igrid] - FluxS3[igridp1]) * multiplier;
        dUTau[igrid] += (FluxTau[igrid] - FluxTau[igridp1]) * multiplier;
    }
}