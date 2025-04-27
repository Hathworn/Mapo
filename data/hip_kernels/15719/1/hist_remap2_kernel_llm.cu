#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

#define TB 256
#define EPS 0.1

#undef MIN
#define MIN(a, b) ((a) < (b) ? (a) : (b))

#undef MAX
#define MAX(a, b) ((a) > (b) ? (a) : (b))

__global__ void hist_remap2_kernel( float *I, int nI, float *mI, float *histJ, float *cumJ, float *_minJ, float *_maxJ, int nbins, float *_sortI, int *_idxI, float *R, int c, int h, int w )
{
    int _id = blockIdx.x * blockDim.x + threadIdx.x;
    int size = h * w;

    if (_id >= c * size) return; // Early exit if outside bounds

    int id = _id % size, dc = _id / size;

    float minJ  = _minJ[dc];
    float maxJ  = _maxJ[dc];
    float stepJ = (maxJ - minJ) / nbins;

    int idxI = _idxI[_id] - 1;
    if (mI[idxI] < EPS) return;

    int offset = h * w - nI;
    int cdf = id - offset;

    int s = 0;
    int e = nbins - 1;
    while (s <= e) {
        int m = (s + e) / 2; // Move m inside the loop
        float cdf_e = m == nbins - 1 ? cumJ[dc * nbins + m] + 0.5f : cumJ[dc * nbins + m];
        float cdf_s = m == 0 ? -0.5f : cumJ[dc * nbins + m - 1];

        if (cdf >= cdf_e) {
            s = m + 1;
        } else if (cdf < cdf_s) {
            e = m - 1;
        } else {
            float hist  = histJ[dc * nbins + m];
            float ratio = MIN(MAX((cdf - cdf_s) / (hist + 1e-8), 0.0f), 1.0f);
            float activation = minJ + (static_cast<float>(m) + ratio) * stepJ;
            R[dc * size + idxI] = activation;
            break;
        }
    }
}