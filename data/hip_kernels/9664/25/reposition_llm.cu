#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reposition(double4 *ac, double4 *ac1, double4 *ac2, double4 *af, unsigned long nextsize)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid index and perform coalesced memory writes
    if (i < nextsize) {
        double4 data_ac = ac[i];
        double4 data_ac1 = ac1[i];
        double4 data_ac2 = ac2[i];

        af[i] = data_ac;
        af[i + nextsize] = data_ac1;
        af[i + 2 * nextsize] = data_ac2;
    }
}