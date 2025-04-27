#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rearrangePopulation(float *gene, float *fit, int* metaData)
{
    const int idx = threadIdx.x + blockDim.x * blockIdx.x;
    int nGene = metaData[1];
    int nHalf = nGene / 2;
    
    if (idx >= nHalf) 
        return; // Terminate threads that are out of range

    int j = nGene - 1 - idx;

    if (fit[idx] < fit[j]) {
        // Swap elements using temporary variables
        for (int k = 0; k < 6; k++) {
            float t = gene[idx * 6 + k];
            gene[idx * 6 + k] = gene[j * 6 + k];
            gene[j * 6 + k] = t;
        }

        float tFit = fit[idx];
        fit[idx] = fit[j];
        fit[j] = tFit;
    }
}