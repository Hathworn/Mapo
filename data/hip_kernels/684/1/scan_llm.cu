#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scan(int *v, const int n)
{
    int tIdx = threadIdx.x;
    int step = 1;

    // Optimize: Use shared memory for faster access
    __shared__ int temp[1024];

    if (tIdx < n) {
        temp[tIdx] = v[tIdx];
    }
    __syncthreads();

    while (step < n) {
        int indiceDroite = tIdx;
        int indiceGauche = indiceDroite + step;

        if (indiceGauche < n) {
            // Optimize: Accumulate values in shared memory
            temp[indiceDroite] += temp[indiceGauche];
        }

        step *= 2;
        __syncthreads();
    }

    if (tIdx < n) {
        // Write back to global memory
        v[tIdx] = temp[tIdx];
    }
}