#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void buildGlobalQuadReg(int noPoints, int noDims, int dimRes, int nYears, int noControls, int year, int control, float* regCoeffs, float* xmins, float* xmaxes, float* regression) {

    // Global thread index
    int idx = blockIdx.x*blockDim.x + threadIdx.x;

    if (idx < noPoints) {
        // Allocate memory on stack for dimIdx and xQ
        int dimIdx[MAX_DIMS]; // Assuming a maximum number of dimensions
        float xQ[MAX_DIMS]; // Assuming a maximum number of dimensions

        // Deconstruct the index into the index along each dimension
        int rem = idx;
        for (int ii = 0; ii < noDims; ii++) {
            int div = rem / (int)pow(dimRes, noDims - ii - 1);
            dimIdx[ii] = div;
            rem -= div * (int)pow(dimRes, noDims - ii - 1);
        }

        // Get the query point coordinates
        for (int ii = 0; ii < noDims; ii++) {
            xQ[ii] = ((float)dimIdx[ii]) * (xmaxes[control * noDims + ii] -
                      xmins[control * noDims + ii]) / (float)dimRes +
                     xmins[control * noDims + ii];
        }

        // Use the regression coefficients to compute the value at this query point
        // Constant
        float computed = regCoeffs[0];

        // Linear Terms
        for (int ii = 0; ii < noDims; ii++) {
            computed += xQ[ii] * regCoeffs[ii + 1];
        }

        // Quadratic and Interacting Terms
        int counter = 0;
        for (int ii = 0; ii < noDims; ii++) {
            for (int jj = ii; jj < noDims; jj++) {
                computed += xQ[ii] * xQ[jj] * regCoeffs[counter + 1 + noDims];
                counter++;
            }
        }

        // Payoff adjustment
        computed = (computed >= 0.0f) ? 0.0f : computed;

        // Store result in regression array
        int baseIdx = year * noControls * (dimRes * noDims + (int)pow(dimRes, noDims) * 2)
                      + control * (dimRes * noDims + (int)pow(dimRes, noDims) * 2)
                      + dimRes * noDims + idx;
        regression[baseIdx] = computed;
    }
}