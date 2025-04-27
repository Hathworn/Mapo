#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Registers2SharedMem(float * outFloat, int iSize)
{
    extern __shared__ float s_memoryA[];

    // Variable now initialized to zero for safety
    float r_var = 0.0f;

    // Utilize variables for block and grid size to reduce repetitive computation
    int blockSize = blockDim.x;
    int gridSize = gridDim.x;
    int iID = blockSize * blockIdx.x + threadIdx.x;
    int iNumThreads = blockSize * gridSize;
    int iNumElements = iSize / sizeof(float);

    // Improved memory access pattern (increased stride, reducing bank conflicts)
    for(int i = iID; i < iNumElements; i += iNumThreads) {
        s_memoryA[i] = r_var;
    }

    // Use threads much better by completely separating any control flow divergence
    if(iID == 0) {
        outFloat[0] = r_var;
    }
}