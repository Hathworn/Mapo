#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void d_putgaps(float *sne7, float *snaw, int *aw2ali, const int snno)
{
    // Compute sino index using blockDim.x for improved readability
    int sni = threadIdx.x + blockIdx.y * blockDim.x;

    // Sino bin index remains unchanged
    int awi = blockIdx.x;

    // Ensuring we are within bounds before assignment
    if (sni < snno) {
        // Use calculated index to set value in sne7 array efficiently
        sne7[aw2ali[awi] * snno + sni] = snaw[awi * snno + sni];
    }
}