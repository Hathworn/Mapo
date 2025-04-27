#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rearrangePopulationWithRange(float *gene, float *fit, int *range)
{
    const int idx = threadIdx.x + blockDim.x * blockIdx.x;
    if (range[0] > range[1]) return;   // Return if range is invalid

    int totalElements = range[1] - range[0] + 1;
    int nHalf = totalElements / 2;
    if (idx >= nHalf) return;  // Ensure threads beyond the valid range do not process
   
    int i = range[0] + idx;
    int j = range[1] - idx;

    if (fit[i] < fit[j]) {
        // Use shared memory for faster access within a block
        __shared__ float tempGene[6 * 256];  // Assuming blockDim.x is at most 256
        __shared__ float tempFit[256];

        for (int k = 0; k < 6; k++) {
            tempGene[threadIdx.x * 6 + k] = gene[i * 6 + k];
        }
        tempFit[threadIdx.x] = fit[i];

        __syncthreads();

        for (int k = 0; k < 6; k++) {
            gene[i * 6 + k] = gene[j * 6 + k];
            gene[j * 6 + k] = tempGene[threadIdx.x * 6 + k];
        }
        fit[i] = fit[j];
        fit[j] = tempFit[threadIdx.x];
    }
}