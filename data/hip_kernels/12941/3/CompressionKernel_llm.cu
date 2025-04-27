#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CompressionKernel(int dimensionalityd, unsigned long long *cbufd, unsigned char *dbufd, int *cutd, int *offd) {
    register int offset, code, bcount, tmp, off, beg, end, lane, warp, iindex, lastidx, start, term;
    register unsigned long long diff, prev;
    __shared__ int ibufs[32 * (3 * WARPSIZE / 2)]; // shared space for prefix sum

    // Calculate lane and warp
    lane = threadIdx.x & 31;
    warp = (threadIdx.x + blockIdx.x * blockDim.x) / WARPSIZE;

    // Setup shared memory indices
    iindex = threadIdx.x / WARPSIZE * (3 * WARPSIZE / 2) + lane;
    ibufs[iindex] = 0;
    iindex += WARPSIZE / 2;
    lastidx = (threadIdx.x / WARPSIZE + 1) * (3 * WARPSIZE / 2) - 1;

    // Determine chunk boundaries
    start = (warp > 0) ? cutd[warp - 1] : 0;
    term = cutd[warp];
    off = ((start + 1) / 2 * 17);
    offset = WARPSIZE - (dimensionalityd - lane % dimensionalityd) - lane;

    prev = 0;
    for (int i = start + lane; i < term; i += WARPSIZE) {
        // Calculate delta and leading zeros
        diff = cbufd[i] - prev;
        code = (diff >> 60) & 8;
      
        if (code != 0) {
            diff = -diff;
        }
        
        bcount = 8 - (__clzll(diff) >> 3);
        bcount = (bcount == 2) ? 3 : bcount; // Encode 6 lead-zero bytes as 5

        // Prefix sum using warp-synchronous operations
        ibufs[iindex] = bcount;
        #pragma unroll
        for(int d = 1; d < 32; d *= 2) {
            int n = __shfl_up_sync(0xFFFFFFFF, ibufs[iindex], d);
            if(lane >= d) {
                ibufs[iindex] += n;
            }
        }

        // Write non-zero bytes to compressed buffer
        beg = off + (WARPSIZE / 2) + ibufs[iindex - 1];
        end = beg + bcount;
        for (; beg < end; beg++) {
            dbufd[beg] = diff;
            diff >>= 8;
        }

        if (bcount >= 3) bcount--;
        tmp = ibufs[lastidx];
        code |= bcount;
        ibufs[iindex] = code;
      
        // Write out half-bytes
        if ((lane & 1) != 0) {
            dbufd[off + (lane >> 1)] = ibufs[iindex - 1] | (code << 4);
        }
      
        off += tmp + (WARPSIZE / 2);

        // Update prediction value
        prev = cbufd[i + offset];
    }

    // Store total bytes of compressed output
    if (lane == 31) offd[warp] = off;
}