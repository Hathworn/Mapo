#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pow_kerneld(double *v, int n, double e) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    if (x < n) {
        // Use fast intrinsic for power calculation
        v[x] = __dpow(v[x], e);
    }
}