#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_divScalarMany(int n, int sizeSubImage, double *result, double *x, double *div) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    int id2 = id / sizeSubImage;  // Calculate the appropriate index for the div array
    if (id < n) {
        double divisor = div[id2];  // Load divisor once to avoid multiple indexing
        if (divisor != 0) {
            result[id] = x[id] / divisor;  // Perform division only if divisor is non-zero
        }
    }
}