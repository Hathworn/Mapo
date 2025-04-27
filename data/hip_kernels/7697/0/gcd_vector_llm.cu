#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;
int threads;

__global__ void gcd_vector(int *d_out, int integer_m) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;  // Calculate global thread index
    int stride = blockDim.x * gridDim.x;  // Calculate stride
    int count = 0;  // Local count variable

    for (int i = idx; i < integer_m; i += stride) {  // Iterate with global stride
        int u = i, v = integer_m;
        while (v != 0) {
            int r = u % v;
            u = v;
            v = r;
        }
        if (u == 1) {
            count++;  // Count GCD equals 1
        }
    }

    atomicAdd(&d_out[0], count);  // Atomic addition to global output
}