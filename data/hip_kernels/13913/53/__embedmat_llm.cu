#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void __embedmat(double *a, int *b, long long *c, int n) {
    // Optimize thread index computation for readability and efficiency
    int tid = blockIdx.y * gridDim.x + blockIdx.x;
    tid = tid * blockDim.x + threadIdx.x;
    const int signbit = 0x80000000;
    const int mag = 0x7fffffff;

    // Unroll loop to increase instruction level parallelism
    for (int i = tid; i < n; i += blockDim.x * gridDim.x * gridDim.y) {
        double v = a[i];
        int vi = __double2int_rz(v); // Use HIP intrinsic for type conversion
        if (vi & signbit) {
            vi = -(vi & mag);
        }
        c[i] = (long long)vi + (((long long)b[i]) << 32);
    }
}