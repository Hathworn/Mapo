#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel for coalesced memory access and reduce index calculations
__global__ void vec_computePSF_signalN2Many_f(int n, int sizePart, int sizeTot, float divide, int* sparseIndexEvenShiftOutput, int* sparseIndexOddShiftOutput, float* fft, int* sparseIndexEvenShiftOutputNext, int* sparseIndexOddShiftOutputNext, float* psffft)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Use stride loop to process all elements within grid
    for (int id = idx; id < n; id += stride) {
        int u = id / sizePart;
        int p = id % sizePart;

        // Cache indices for coalesced access
        int evenIndex = sparseIndexEvenShiftOutput[p] + sizeTot * u;
        int oddIndex = sparseIndexOddShiftOutput[p] + sizeTot * u;
        int psfIndexEven = sparseIndexEvenShiftOutputNext[p] + 2 * sizePart * u;
        int psfIndexOdd = sparseIndexOddShiftOutputNext[p] + 2 * sizePart * u;

        float x = fft[evenIndex] / divide;
        float y = fft[oddIndex] / divide;

        // Store results
        psffft[psfIndexEven] = x * x + y * y;
        psffft[psfIndexOdd] = 0;
    }
}