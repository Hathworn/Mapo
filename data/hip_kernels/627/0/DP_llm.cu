#include "hip/hip_runtime.h"
#include "includes.h"

// Length of each data
__constant__ int gcT_size;
__constant__ int gcP_size;

// Threshold of the SW algorithm
__constant__ int gcThre;

// Data of the query
__constant__ char gcP_seq[1024];

// Cost and Gain
__constant__ int gcMatch;
__constant__ int gcMiss;
__constant__ int gcExtend;
__constant__ int gcBegin;

enum {
    Zero,
    Diagonal,
    Vertical,
    Horizon,
};

using namespace std;

__global__ void DP(char* dT_seq, char* dTrace, int* dScore) {
    // ThreadId = ptn point
    int id = threadIdx.x;
    // The acid in this thread
    char p = gcP_seq[id];
    // p-1 row line's value
    __shared__ int Hp_1[1024];
    __shared__ int Ep_1[1024];
    // Temporary
    int Hp_1_buf = 0;
    int Ep_1_buf = 0;
    // t-1 element value
    int Ht_1 = 0;
    int Ft_1 = 0;
    // p-1 t-1 element value
    int Ht_1p_1 = 0;
    // Initialize
    Hp_1[id] = 0;
    Ep_1[id] = 0;
    // Similar score
    int sim = 0;
    int point = id * gcT_size - id;

    // Calculate elements
    for (int t = -id; t < gcT_size; ++t) {
        // Get similar score
        if (t >= 0) {
            // Compare acids
            sim = (dT_seq[t] == p) ? gcMatch : gcMiss;

            // SW algorithm: Calculate each element
            int diagonal = Ht_1p_1 + sim;
            int horizonStart = Ht_1 + gcBegin;
            Ft_1 = max(horizonStart, Ft_1 + gcExtend);
            int verticalStart = Hp_1[id] + gcBegin;
            Ep_1_buf = max(verticalStart, Ep_1[id] + gcExtend);

            // Determine the max score and corresponding trace
            if (diagonal > Ep_1_buf && diagonal > Ft_1) {
                Ht_1 = diagonal;
                dTrace[point] = Diagonal;
            } else if (Ep_1_buf > Ft_1) {
                Ht_1 = Ep_1_buf;
                dTrace[point] = Vertical;
            } else {
                Ht_1 = Ft_1;
                dTrace[point] = Horizon;
            }

            // Zero is the max
            if (Ht_1 <= 0) {
                Ht_1 = 0;
                Ft_1 = 0;
                Ep_1_buf = 0;
                dTrace[point] = Zero;
            }

            // Hp-1 is next Ht-1p-1
            Ht_1p_1 = Hp_1[id];
            __syncthreads();

            // Set value needed for next calculation
            if (t >= 0) {
                Hp_1[id + 1] = Ht_1;
                Ep_1[id + 1] = Ep_1_buf;
            }

            // Update score if it exceeds the threshold
            if (Ht_1 >= gcThre && Ht_1 >= (dScore[t] & 0x0000ffff)) {
                dScore[t] = Ht_1 + (id << 16);
            }
        }
        ++point;
        __syncthreads();
    }
}