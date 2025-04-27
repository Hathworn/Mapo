#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void createQueryPoints(int noPoints, int noDims, int dimRes, int control, int noControls, int year, float* xmins, float* xmaxes, float* regression, float* queryPts) {
    // Global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < noPoints) {
        // Allocate on stack instead of heap for performance gain
        int dimIdx[MAX_DIMS];  // Assuming MAX_DIMS is defined and encompasses all possible dimensions

        int rem = idx;

        // Precompute powers of dimRes to avoid repeated calculations
        int powers[MAX_DIMS];
        for (int ii = 0; ii < noDims; ii++) {
            powers[ii] = pow(dimRes, noDims - ii - 1);
        }

        for (int ii = 0; ii < noDims; ii++) {
            int div = rem / powers[ii];
            dimIdx[ii] = div;
            rem -= div * powers[ii];
        }

        // Get the query point coordinates using precomputed values where possible
        for (int ii = 0; ii < noDims; ii++) {
            float range = xmaxes[noControls * noDims + ii] - xmins[noControls * noDims + ii];
            queryPts[idx + ii * noPoints] = ((float)dimIdx[ii]) * range / (float)(dimRes - 1) + xmins[noControls * noDims + ii];

            // Save the X value for the query point
            regression[year * noControls * (dimRes * noDims + (int)pow(dimRes, noDims) * 2) + control * (dimRes * noDims + (int)pow(dimRes, noDims) * 2) + ii * dimRes + dimIdx[ii]] = queryPts[idx + ii * noPoints];
        }
    }
}