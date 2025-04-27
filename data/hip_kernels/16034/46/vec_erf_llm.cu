#include "hip/hip_runtime.h"
#include "includes.h"

//=== Vector comparison ======================================================

//WARNING : device_sum size should be gridDim.x
__global__ void vec_erf (int n, double *result, double *x) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Flattened index calculation
    if (idx < n) {
        result[idx] = erf(x[idx]); // Compute erf only when idx is valid
    }
}
```
