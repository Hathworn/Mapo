#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void KerCalcRidp(unsigned n, unsigned ini, unsigned idini, unsigned idfin, const unsigned *idp, unsigned *ridp)
{
    unsigned p = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread index
    if (p < n) {
        p += ini; // Adjust particle index with ini
        const unsigned id = idp[p]; // Fetch id for particle
        if (idini <= id && id < idfin) {
            unsigned ridx = id - idini; // Precompute output index
            ridp[ridx] = p; // Directly assign to ridp
        }
    }
}