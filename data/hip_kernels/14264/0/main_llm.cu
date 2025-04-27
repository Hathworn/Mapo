#include <stdbool.h>
#include <stdio.h>
#include <string.h>
#include <getopt.h>
#include <stdlib.h>
#include <sys/time.h>
#include <hip/hip_runtime.h>
#include "createMovieRatingsKernel_llm.cu"
#include <chrono>
#include <iostream>
using namespace std;
using namespace std::chrono;
int main(int argc, char **argv) {
hipSetDevice(0);

    int XSIZE = 512; 
    int YSIZE = 512;
    int BLOCKX = 16;
    int BLOCKY = 16;

    if (argc > 1) XSIZE = atoi(argv[1]);
    if (argc > 2) YSIZE = atoi(argv[2]);
    if (argc > 3) BLOCKX = atoi(argv[3]);
    if (argc > 4) BLOCKY = atoi(argv[4]);
    const float *weights = NULL;
hipMalloc(&weights, XSIZE*YSIZE);
const float *initial_hidden_feature_probs = NULL;
hipMalloc(&initial_hidden_feature_probs, XSIZE*YSIZE);
float *movie_rating_probs = NULL;
hipMalloc(&movie_rating_probs, XSIZE*YSIZE);
int num_movies = 1;
int num_hidden_features = 1;
int iXSIZE= XSIZE;
int iYSIZE= YSIZE;
while(iXSIZE%BLOCKX!=0) {
iXSIZE++;
}
while(iYSIZE%BLOCKY!=0) {
iYSIZE++;
}
dim3 gridBlock(iXSIZE/BLOCKX, iYSIZE/BLOCKY);
dim3 threadBlock(BLOCKX, BLOCKY);
hipFree(0);
createMovieRatingsKernel<<<gridBlock, threadBlock>>>(weights,initial_hidden_feature_probs,movie_rating_probs,num_movies,num_hidden_features);
hipDeviceSynchronize();
for (int loop_counter = 0; loop_counter < 5; ++loop_counter) {
createMovieRatingsKernel<<<gridBlock, threadBlock>>>(weights,initial_hidden_feature_probs,movie_rating_probs,num_movies,num_hidden_features);
}
hipDeviceSynchronize();
auto start = steady_clock::now();
for (int loop_counter = 0; loop_counter < 5; loop_counter++) {
createMovieRatingsKernel<<<gridBlock, threadBlock>>>(weights,initial_hidden_feature_probs,movie_rating_probs,num_movies,num_hidden_features);
}
hipDeviceSynchronize();
auto end = steady_clock::now();
auto usecs = duration_cast<duration<float, microseconds::period>>(end - start);
cout << '[' << usecs.count() << ',' << '(' << BLOCKX << ',' << BLOCKY << ')' << ',' << '(' << XSIZE << ',' << YSIZE << ')' << ']' << endl;
}