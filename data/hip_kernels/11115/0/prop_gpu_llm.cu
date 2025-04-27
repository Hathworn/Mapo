```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define C0  0
#define CZ1 1
#define CX1 2
#define CY1 3
#define CZ2 4
#define CX2 5
#define CY2 6
#define CZ3 7
#define CX3 8
#define CY3 9
#define CZ4 10
#define CX4 11
#define CY4 12

__global__ void prop_gpu(float *p0, float *p1, float *vel, float *coeffs, int _nx, int _ny, int _nz, int _n12) {
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    int row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure boundary conditions are met before proceeding
    if (col >= 4 && col < _nx - 4 && row >= 4 && row < _ny - 4) {
        int ii = row * _nx + col;
        int stride_x = 1;
        int stride_y = _nx;
        int stride_z = _n12;

        for (int z = 4; z < _nz - 4; z++) {
            float val = coeffs[C0] * p1[ii];
            // Compute contributions along X, Y, and Z separately
            for (int offset = 1; offset <= 4; offset++) {
                val += coeffs[offset] * (p1[ii - offset * stride_x] + p1[ii + offset * stride_x]);
                val += coeffs[offset + 4] * (p1[ii - offset * stride_y] + p1[ii + offset * stride_y]);
                val += coeffs[offset + 8] * (p1[ii - offset * stride_z] + p1[ii + offset * stride_z]);
            }
            p0[ii] = vel[ii] * val + 2 * p1[ii] - p0[ii];
            ii += stride_z;
        }
    }
}
```
