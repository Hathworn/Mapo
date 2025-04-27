#include "hip/hip_runtime.h"
#include "includes.h"

/* Optimize kernel by reducing branching and improving memory access */

/*numCirs: num of total circles
*/
__global__ void kernelCompact(float* devSrc, float* devDst, unsigned int* devPredicate, unsigned int* devPos, int numCirs, int offset)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x; //index of the circles

    // Check bounds once to avoid unnecessary checks
    if (idx < numCirs && devPredicate[idx] == 1)
    {
        unsigned int pos = devPos[idx] * offset;
        idx *= offset;

        // Optimize memory access pattern by unrolling the loop
        for (int i = 0; i < offset; ++i)
        {
            devDst[pos + i] = devSrc[idx + i];
        }
    }
}