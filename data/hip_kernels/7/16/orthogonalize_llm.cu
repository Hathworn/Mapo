#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void orthogonalize(float *eigvec, float *Qi_gdof, int cdof, int *blocksizes, int *blocknums, int largestblock) {
    int blockNum = blockIdx.x * blockDim.x + threadIdx.x;

    int curr_evec = 6;
    int size = blocksizes[blockNum];
    int startatom = blocknums[blockNum] / 3;

    // Cache current block offset in Qi_gdof for reuse
    int Qi_gdof_offset = blockNum * 6 * largestblock;

    for (int j = 0; j < size; j++) {
        if (curr_evec == size) break;

        for (int l = 0; l < size; l++) {
            Qi_gdof[Qi_gdof_offset + l * 6 + curr_evec] = eigvec[(blocknums[blockNum] + l) * largestblock + j];
        }

        for (int k = 0; k < curr_evec; k++) {
            double dot_prod = 0.0;
            for (int l = 0; l < size; l++) {
                dot_prod += Qi_gdof[Qi_gdof_offset + l * 6 + k] * eigvec[(blocknums[blockNum] + l) * largestblock + j];
            }

            // Fuse loops for updating Qi_gdof to decrease array accesses
            double *Qi_gdof_curr = Qi_gdof + Qi_gdof_offset + curr_evec;
            for (int l = 0; l < size; l++) {
                Qi_gdof_curr[l * 6] -= Qi_gdof[Qi_gdof_offset + l * 6 + k] * dot_prod;
            }
        }

        double norm = 0.0;
        for (int l = 0; l < size; l++) {
            norm += Qi_gdof[Qi_gdof_offset + l * 6 + curr_evec] * Qi_gdof[Qi_gdof_offset + l * 6 + curr_evec];
        }

        if (norm < 0.05) continue; // Skip if norm is too small

        norm = sqrt(norm);
        for (int l = 0; l < size; l++) {
            Qi_gdof[Qi_gdof_offset + l * 6 + curr_evec] /= norm;
        }

        curr_evec++;
    }

    for (int j = 0; j < curr_evec; j++) {
        for (int k = 0; k < size; k++) {
            eigvec[(startatom + k) * largestblock + (startatom + j)] = Qi_gdof[Qi_gdof_offset + k * 6 + j];
        }
    }
}