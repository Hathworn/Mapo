#include "hip/hip_runtime.h"
#include "includes.h"

// ERROR CHECKING MACROS //////////////////////////////////////////////////////

__global__ void buildGlobalLinReg(int noPoints, int noDims, int dimRes, int nYears, int noControls, int year, int control, float* regCoeffs, float* xmins, float* xmaxes, float* regression) {

    // Global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < noPoints) {
        // Preallocate memory for indices and query point coordinates in registers
        int dimIdx[10]; // Assume noDims <= 10 for register allocation
        float xQ[10];   // Assume noDims <= 10 for register allocation

        int rem = idx;

        // Deconstruct the index into the index along each dimension
        for (int ii = 0; ii < noDims; ii++) {
            int div = (int)(rem / powf(dimRes, noDims - ii - 1));
            dimIdx[ii] = div;
            rem = rem - div * powf(dimRes, noDims - ii - 1);
        }

        // Get the query point coordinates
        for (int ii = 0; ii < noDims; ii++) {
            xQ[ii] = ((float)dimIdx[ii]) * (xmaxes[control * noDims + ii] -
                xmins[control * noDims + ii]) / (float)dimRes +
                xmins[control * noDims + ii];
        }

        // Use the regression coefficients to compute the value at this query point
        float computed = regCoeffs[0];

        for (int ii = 0; ii < noDims; ii++) {
            computed += xQ[ii] * regCoeffs[ii + 1];
        }

        if (computed >= 0) {
            computed = 0;
        }

        regression[year * noControls * (dimRes * noDims + (int)powf(dimRes, noDims) * 2)
            + control * (dimRes * noDims + (int)powf(dimRes, noDims) * 2) + dimRes *
            noDims + idx] = computed;
    }
}