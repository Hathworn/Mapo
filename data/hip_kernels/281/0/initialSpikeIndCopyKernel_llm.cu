#include "hip/hip_runtime.h"
#include "includes.h"

/* Error checking */
#define CUDA_ERROR_CHECK
#define CURAND_ERROR_CHECK
#define CUDA_CALL( err) __cudaCall( err, __FILE__, __LINE__ )
#define CURAND_CALL( err) __curandCall( err, __FILE__, __LINE__)
#define CUDA_CHECK_ERROR()    __cudaCheckError( __FILE__, __LINE__ )

__global__ void initialSpikeIndCopyKernel(unsigned short* pLastSpikeInd, const unsigned int noReal)
{
    // Calculate the global index once and reuse it
    unsigned int globalIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (globalIndex < noReal * noSpikes) // Ensure no boundary overflow
    {
        // Use local variable to store computed index for efficient memory access
        unsigned int spikeNo = globalIndex / noReal;
        pLastSpikeInd[globalIndex] = pLastSpikeInd[spikeNo * noReal];
    }
}