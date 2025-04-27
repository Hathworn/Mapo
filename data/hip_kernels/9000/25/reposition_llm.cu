#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reposition(double4 *ac, double4 *ac1, double4 *ac2, double4 *af, unsigned long nextsize)
{
    // Calculate the global index once to avoid recomputation
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single if statement to reduce branching
    if (i < nextsize) {
        // Perform memory accesses in a coalesced manner to improve performance
        double4 temp_ac = ac[i];
        double4 temp_ac1 = ac1[i];
        double4 temp_ac2 = ac2[i];

        af[i] = temp_ac;
        af[i + nextsize] = temp_ac1;
        af[i + 2 * nextsize] = temp_ac2;
    }
}