```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define INF 100000000
#define BLOCKSIZE 128
#define BITSFT 7 // log2(BLOCKSIZE)

__global__ void pFloyd(float *D, float *Q, int vertices, int k, int k2)
{
    int i = blockIdx.x;
    int j = (blockIdx.y << BITSFT) + threadIdx.x;
    int index = (i << vertices) + j;
    
    // Load common data into registers for efficiency
    float Dik = D[(i << vertices) + k];
    float Dkj = D[k2 + j];
    float Dij = D[index];

    // Use temporary variable to store updated distance
    float newDist = Dik + Dkj;

    // Compare and update directly
    if (newDist < Dij) {
        D[index] = newDist;
        Q[index] = k;
    }
}