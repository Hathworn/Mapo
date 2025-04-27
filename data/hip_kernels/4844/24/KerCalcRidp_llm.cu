#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerCalcRidp(unsigned n, unsigned ini, unsigned idini, unsigned idfin, const unsigned *idp, unsigned *ridp)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global particle index.
    if (p < n)
    {
        p += ini; // Adjust index by initial offset.
        unsigned id = idp[p]; // Fetch particle id.
        if (idini <= id && id < idfin)
        {
            atomicAdd(&ridp[id - idini], p); // Use atomic operation to prevent race conditions.
        }
    }
}