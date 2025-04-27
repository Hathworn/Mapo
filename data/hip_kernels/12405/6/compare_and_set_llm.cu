#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"
__global__ void compare_and_set(double* A, double* ret, int rlen, int clen, double compareVal, double tol, double ifEqualsVal, double ifLessThanVal, double ifGreaterThanVal) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int ix = tid / clen;
    int iy = tid % clen;
    
    // Check bounds
    if (ix < rlen && iy < clen) {
        // Linear index calculation
        int index = ix * clen + iy;

        // Compare and assign values
        double diff = fabs(A[index] - compareVal); // Use `fabs` for double
        if (diff < tol) {
            ret[index] = ifEqualsVal;
        } else if (A[index] < compareVal) {
            ret[index] = ifLessThanVal;
        } else {
            ret[index] = ifGreaterThanVal;
        }
    }
}
```
