#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _kpoly32(int nx, int ns, float *xval, int *xrow, int *xcol, float *sval, int *srow, int *scol, float *k, float c, float d) {
int i, n, x1, x2, xc, xr, s1, s2, sc, sr;
i = threadIdx.x + blockIdx.x * blockDim.x;
n = nx*ns;
while (i < n) {
double ki = 0;
xc = i % nx;
sc = i / nx;
x1 = xcol[xc]-1; x2 = xcol[xc+1]-1;
s1 = scol[sc]-1; s2 = scol[sc+1]-1;
while ((x1 < x2) && (s1 < s2)) {
xr = xrow[x1]; sr = srow[s1];
if (sr < xr) s1++;
else if (xr < sr) x1++;
else ki += xval[x1++]*sval[s1++];
}
k[i] = pow(ki + c, (double) d);
i += blockDim.x * gridDim.x;
}
}