#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bin_start(int *binStart, int *binEnd, int *partBin, int nparts)
{
    extern __shared__ int sharedBin[];    
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int bin;

    if (index < nparts) {
        bin = partBin[index];
        sharedBin[threadIdx.x + 1] = bin;

        // First thread loads the previous bin if necessary
        if (threadIdx.x == 0) {
            sharedBin[0] = (index > 0) ? partBin[index - 1] : -1;
        }
    }
    __syncthreads();

    if (index < nparts) {
        bin = partBin[index];

        // Check if the current particle is the start of a new bin
        if (index == 0 || bin != sharedBin[threadIdx.x]) {
            binStart[bin] = index;
            if (index > 0) {
                binEnd[sharedBin[threadIdx.x]] = index;
            }
        }

        // Handle the last particle separately
        if (index == nparts - 1) {
            binEnd[bin] = nparts;
        }
    }
}
```
