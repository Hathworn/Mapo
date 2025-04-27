#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SharedMem2Registers(float * outFloat, int iSize)
{
    /* Amount of shared memory is determined by host call */
    extern __shared__ float s_memoryA[];
    
    /* Generate global index */
    int iID = blockDim.x * blockIdx.x + threadIdx.x;
    
    /* Get the number of available threads */
    int iNumThreads = blockDim.x * gridDim.x;
    
    /* Calculate number of elements */
    int iNumElements = iSize / sizeof(float);
    
    /* Read global memory (coalesce) to shared memory */
    for(int i = iID; i < iNumElements; i += iNumThreads) {
        s_memoryA[i] = outFloat[i]; // Improved reading from global to shared memory
    }
    
    /* Sync all threads to ensure shared memory is fully populated */
    __syncthreads(); // Ensure all threads reach this point before proceeding
    
    /* Variable in register; Read from shared memory to register */
    float r_var = 0.0f;
    if (iID < iNumElements) {
        r_var = s_memoryA[iID];
    }
    
    /* Conditionally assign register var, so it won't get optimized */
    if(iID == 0) outFloat[0] = r_var;
}