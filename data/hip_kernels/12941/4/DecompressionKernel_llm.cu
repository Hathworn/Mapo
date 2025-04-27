#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void DecompressionKernel(int dimensionalityd, unsigned char *compressed_data_buffer_in, int *chunk_boundaries_buffer_in, unsigned long long *uncompressed_data_buffer_out) {
    register int offset, code, bcount, off, beg, end, lane, warp, iindex, lastidx, start, term;
    register unsigned long long diff, prev;
    __shared__ int ibufs[32 * (3 * WARPSIZE / 2)];

    lane = threadIdx.x & 31; // Thread index within warp
    iindex = threadIdx.x / WARPSIZE * (3 * WARPSIZE / 2) + lane;
    ibufs[iindex] = 0;
    iindex += WARPSIZE / 2;
    lastidx = (threadIdx.x / WARPSIZE + 1) * (3 * WARPSIZE / 2) - 1;
    warp = (threadIdx.x + blockIdx.x * blockDim.x) / WARPSIZE;
    offset = WARPSIZE - (dimensionalityd - lane % dimensionalityd) - lane;

    start = (warp > 0) ? chunk_boundaries_buffer_in[warp - 1] : 0;
    term = chunk_boundaries_buffer_in[warp];
    off = ((start + 1) / 2 * 17);

    prev = 0;
    for (int i = start + lane; i < term; i += WARPSIZE) {
        if ((lane & 1) == 0) {
            code = compressed_data_buffer_in[off + (lane >> 1)];
            ibufs[iindex] = code & 0xf; // Store lower nibble
            ibufs[iindex + 1] = code >> 4; // Store upper nibble
        }
        __syncthreads(); // Synchronize threads within block

        bcount = ibufs[iindex] & 7;
        if (bcount >= 2) bcount++;

        ibufs[iindex] = bcount;
        __syncthreads(); // Synchronize for prefix sum

        // Parallel prefix sum
        if (lane >= 1) ibufs[iindex] += ibufs[iindex - 1];
        if (lane >= 2) ibufs[iindex] += ibufs[iindex - 2];
        if (lane >= 4) ibufs[iindex] += ibufs[iindex - 4];
        if (lane >= 8) ibufs[iindex] += ibufs[iindex - 8];
        if (lane >= 16) ibufs[iindex] += ibufs[iindex - 16];
        
        __syncthreads(); // Synchronize for data read

        beg = off + ibufs[iindex - 1];
        off += ibufs[lastidx];
        end = beg + bcount - 1;
        diff = 0;
        for (; beg <= end; end--) {
            diff = (diff << 8) | compressed_data_buffer_in[end];
        }

        if ((ibufs[iindex] & 8) != 0) {
            diff = -diff;
        }

        uncompressed_data_buffer_out[i] = prev + diff;
        prev = uncompressed_data_buffer_out[i + offset];
    }
}