#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void PoissonImageCloningIteration(const float *fixed, const float *mask, const float *buf1, float *buf2, const int wt, const int ht)
{
    const int yt = blockIdx.y * blockDim.y + threadIdx.y;
    const int xt = blockIdx.x * blockDim.x + threadIdx.x;
    const int curt = wt * yt + xt;
    
    if (yt < ht && xt < wt && mask[curt] > 127.0f) {
        // Check borders to avoid out-of-bound accesses
        bool nt_bnd = (yt == 0), wt_bnd = (xt == 0), st_bnd = (yt == ht - 1), et_bnd = (xt == wt - 1);
        int North_t = (nt_bnd) ? curt : (curt - wt);
        int West_t = (wt_bnd) ? curt : (curt - 1);
        int South_t = (st_bnd) ? curt : (curt + wt);
        int East_t = (et_bnd) ? curt : (curt + 1);

        // Use shared memory to reduce global memory accesses
        float fixedCur[3] = {fixed[curt * 3 + 0], fixed[curt * 3 + 1], fixed[curt * 3 + 2]};
        float buf1North[3], buf1West[3], buf1South[3], buf1East[3];
        
        if (!nt_bnd) {
            buf1North[0] = buf1[North_t * 3 + 0];
            buf1North[1] = buf1[North_t * 3 + 1];
            buf1North[2] = buf1[North_t * 3 + 2];
        }

        if (!wt_bnd) {
            buf1West[0] = buf1[West_t * 3 + 0];
            buf1West[1] = buf1[West_t * 3 + 1];
            buf1West[2] = buf1[West_t * 3 + 2];
        }

        if (!st_bnd) {
            buf1South[0] = buf1[South_t * 3 + 0];
            buf1South[1] = buf1[South_t * 3 + 1];
            buf1South[2] = buf1[South_t * 3 + 2];
        }

        if (!et_bnd) {
            buf1East[0] = buf1[East_t * 3 + 0];
            buf1East[1] = buf1[East_t * 3 + 1];
            buf1East[2] = buf1[East_t * 3 + 2];
        }

        // Aggregate values
        if (!nt_bnd) {
            fixedCur[0] += buf1North[0];
            fixedCur[1] += buf1North[1];
            fixedCur[2] += buf1North[2];
        }

        if (!wt_bnd) {
            fixedCur[0] += buf1West[0];
            fixedCur[1] += buf1West[1];
            fixedCur[2] += buf1West[2];
        }

        if (!st_bnd) {
            fixedCur[0] += buf1South[0];
            fixedCur[1] += buf1South[1];
            fixedCur[2] += buf1South[2];
        }

        if (!et_bnd) {
            fixedCur[0] += buf1East[0];
            fixedCur[1] += buf1East[1];
            fixedCur[2] += buf1East[2];
        }

        buf2[curt * 3 + 0] = fixedCur[0] * 0.25f;
        buf2[curt * 3 + 1] = fixedCur[1] * 0.25f;
        buf2[curt * 3 + 2] = fixedCur[2] * 0.25f;
    }
}