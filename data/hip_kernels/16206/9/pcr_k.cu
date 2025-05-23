#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pcr_k(float* a, float* b, float* c, float* y, int n) {
// Identifies the thread working within a group
int tidx = threadIdx.x % n;
// Identifies the data concerned by the computations
int Qt = (threadIdx.x - tidx) / n;
// The global memory access index
int gb_index_x = Qt + blockIdx.x * (blockDim.x / n);
// Local integers
int i, nt, lL, d, tL, tR;
// Local floats
float aL, bL, cL, yL, aLp, bLp, cLp, yLp;
// Shared memory
extern __shared__ float sAds[];

nt = 5 * Qt * n;
d = (n / 2 + (n % 2)) * (tidx % 2) + (int)tidx / 2;
float* sa = (float*)&sAds[nt];
float* sb = (float*)&sa[n];
float* sc = (float*)&sb[n];
float* sy = (float*)&sc[n];
int* sl = (int*)&sy[n];

sa[tidx] = a[gb_index_x * n + tidx];
sb[tidx] = b[gb_index_x * n + tidx];
sc[tidx] = c[gb_index_x * n + tidx];
sy[tidx] = y[gb_index_x * n + tidx];
sl[tidx] = tidx;
__syncthreads();

//Left/Right indices of the reduction
tL = tidx - 1;
if (tL < 0) tL = 0;
tR = tidx + 1;
if (tR >= n) tR = 0;

for (i = 0; i < (int)log2((float)n) + 1; i++) {
lL = (int)sl[tidx];
aL = sa[tidx];
bL = sb[tidx];
cL = sc[tidx];
yL = sy[tidx];

bLp = sb[tL];
//Reduction phase
if (fabsf(aL) > EPS) {
aLp = sa[tL];
cLp = sc[tL];
yLp = sy[tL];
float temp1 = aL / bLp;
bL -= cLp * temp1;
yL -= yLp * temp1;
aL = -aLp * temp1;
}

aLp = sa[tR];
bLp = sb[tR];
cLp = sc[tR];
float temp2 = cL / bLp;
if (fabsf(aLp) > EPS) {
yLp = sy[tR];
bL -= aLp * temp2;
yL -= yLp * temp2;
cL = -cLp * temp2;
}
__syncthreads();
//Permutation phase
if (i < (int)log2((float)n)) {
sa[d] = aL;
sb[d] = bL;
sc[d] = cL;
sy[d] = yL;
sl[d] = (int)lL;
__syncthreads();
}
}

sy[(int)tidx] = yL / bL;
__syncthreads();
y[gb_index_x * n + sl[tidx]] = sy[tidx];
}