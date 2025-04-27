#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void rovCorrection(int noPoints, int noDims, int dimRes, int nYears, int noControls, int year, int control, float* regression) {
    // Global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < noPoints) {
        // Precalculate constant indices for performance
        int baseIndex = year * noControls * (dimRes * noDims + (int)powf(dimRes, noDims) * 2) + control * (dimRes * noDims + (int)powf(dimRes, noDims) * 2);
        int regIndex = baseIndex + dimRes * noDims + idx;

        float currVal = regression[regIndex];

        // Ensure surrogate value is non-positive
        if (currVal > 0) {
            regression[regIndex] = 0.0;
        }
    }
}