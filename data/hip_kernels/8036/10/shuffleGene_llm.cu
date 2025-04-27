```c++
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void shuffleGene(float *gene, float *fit, float *rSeed, int* metaData) {
    const int idx = threadIdx.x + blockDim.x * blockIdx.x;
    int nGene = metaData[1];
    int nHalf = nGene / 2;
    if (idx >= nHalf) return;  // Corrected condition to include idx == nHalf

    int Offset = int(nHalf / 5.3);
    int j = nHalf + (idx + Offset) % nHalf;

    // Eliminate repeated memory accesses by introducing temporary variables
    float tmpGene[6];
    for (int k = 0; k < 6; k++) {
        tmpGene[k] = gene[j * 6 + k];
    }

    for (int k = 0; k < 6; k++) {
        float t = gene[idx * 6 + k];
        gene[idx * 6 + k] = tmpGene[k];
        gene[j * 6 + k] = t;
    }
   
    // Swap fitness values once outside loop
    float tFit = fit[idx];
    fit[idx] = fit[j];
    fit[j] = tFit;
}