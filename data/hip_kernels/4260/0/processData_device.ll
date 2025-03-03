; ModuleID = '../data/hip_kernels/4260/0/main.cu'
source_filename = "../data/hip_kernels/4260/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11processDataPhPiE7sfilter = internal unnamed_addr addrspace(3) global [3 x [3 x i32]] undef, align 16
@_ZZ11processDataPhPiE2sR = internal unnamed_addr addrspace(3) global [3 x [512 x i32]] undef, align 16
@_ZZ11processDataPhPiE2sG = internal unnamed_addr addrspace(3) global [3 x [512 x i32]] undef, align 16
@_ZZ11processDataPhPiE2sB = internal unnamed_addr addrspace(3) global [3 x [512 x i32]] undef, align 16
@_ZZ11processDataPhPiE5sRsum = internal unnamed_addr addrspace(3) global [512 x i32] undef, align 16
@_ZZ11processDataPhPiE5sGsum = internal unnamed_addr addrspace(3) global [512 x i32] undef, align 16
@_ZZ11processDataPhPiE5sBsum = internal unnamed_addr addrspace(3) global [512 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z11processDataPhPi(i8 addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture readonly %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add nsw i32 %10, %3
  %12 = icmp ult i32 %3, 9
  br i1 %12, label %13, label %25

13:                                               ; preds = %2
  %14 = zext i32 %3 to i64
  %15 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %14
  %16 = load i32, i32 addrspace(1)* %15, align 4, !tbaa !7, !amdgpu.noclobber !6
  %17 = trunc i32 %3 to i8
  %18 = freeze i8 %17
  %19 = udiv i8 %18, 3
  %20 = zext i8 %19 to i32
  %21 = mul i8 %19, 3
  %22 = sub i8 %18, %21
  %23 = zext i8 %22 to i32
  %24 = getelementptr inbounds [3 x [3 x i32]], [3 x [3 x i32]] addrspace(3)* @_ZZ11processDataPhPiE7sfilter, i32 0, i32 %20, i32 %23
  store i32 %16, i32 addrspace(3)* %24, align 4, !tbaa !7
  br label %25

25:                                               ; preds = %13, %2
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %26 = icmp eq i32 %4, 0
  %27 = icmp eq i32 %4, 511
  %28 = or i1 %26, %27
  %29 = icmp eq i32 %3, 0
  %30 = select i1 %28, i1 true, i1 %29
  %31 = icmp eq i32 %3, 511
  %32 = select i1 %30, i1 true, i1 %31
  br i1 %32, label %33, label %52

33:                                               ; preds = %25
  %34 = mul nsw i32 %11, 3
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !11, !amdgpu.noclobber !6
  %38 = zext i8 %37 to i32
  %39 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ11processDataPhPiE5sRsum, i32 0, i32 %3
  store i32 %38, i32 addrspace(3)* %39, align 4, !tbaa !7
  %40 = add nsw i32 %34, 1
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %41
  %43 = load i8, i8 addrspace(1)* %42, align 1, !tbaa !11, !amdgpu.noclobber !6
  %44 = zext i8 %43 to i32
  %45 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ11processDataPhPiE5sGsum, i32 0, i32 %3
  store i32 %44, i32 addrspace(3)* %45, align 4, !tbaa !7
  %46 = add nsw i32 %34, 2
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %47
  %49 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !11, !amdgpu.noclobber !6
  %50 = zext i8 %49 to i32
  %51 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ11processDataPhPiE5sBsum, i32 0, i32 %3
  store i32 %50, i32 addrspace(3)* %51, align 4, !tbaa !7
  br label %52

52:                                               ; preds = %25, %33
  switch i32 %4, label %53 [
    i32 511, label %241
    i32 0, label %241
  ]

53:                                               ; preds = %52
  %54 = mul nsw i32 %11, 3
  %55 = add nsw i32 %54, -1536
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %56
  %58 = load i8, i8 addrspace(1)* %57, align 1, !tbaa !11, !amdgpu.noclobber !6
  %59 = zext i8 %58 to i32
  %60 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sR, i32 0, i32 0, i32 %3
  store i32 %59, i32 addrspace(3)* %60, align 4, !tbaa !7
  %61 = sext i32 %54 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %61
  %63 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !11, !amdgpu.noclobber !6
  %64 = zext i8 %63 to i32
  %65 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sR, i32 0, i32 1, i32 %3
  store i32 %64, i32 addrspace(3)* %65, align 4, !tbaa !7
  %66 = add nsw i32 %54, 1536
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %67
  %69 = load i8, i8 addrspace(1)* %68, align 1, !tbaa !11, !amdgpu.noclobber !6
  %70 = zext i8 %69 to i32
  %71 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sR, i32 0, i32 2, i32 %3
  store i32 %70, i32 addrspace(3)* %71, align 4, !tbaa !7
  %72 = add nsw i32 %54, -1535
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %73
  %75 = load i8, i8 addrspace(1)* %74, align 1, !tbaa !11, !amdgpu.noclobber !6
  %76 = zext i8 %75 to i32
  %77 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sG, i32 0, i32 0, i32 %3
  store i32 %76, i32 addrspace(3)* %77, align 4, !tbaa !7
  %78 = add nsw i32 %54, 1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %79
  %81 = load i8, i8 addrspace(1)* %80, align 1, !tbaa !11, !amdgpu.noclobber !6
  %82 = zext i8 %81 to i32
  %83 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sG, i32 0, i32 1, i32 %3
  store i32 %82, i32 addrspace(3)* %83, align 4, !tbaa !7
  %84 = add nsw i32 %54, 1537
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %85
  %87 = load i8, i8 addrspace(1)* %86, align 1, !tbaa !11, !amdgpu.noclobber !6
  %88 = zext i8 %87 to i32
  %89 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sG, i32 0, i32 2, i32 %3
  store i32 %88, i32 addrspace(3)* %89, align 4, !tbaa !7
  %90 = add nsw i32 %54, -1534
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %91
  %93 = load i8, i8 addrspace(1)* %92, align 1, !tbaa !11, !amdgpu.noclobber !6
  %94 = zext i8 %93 to i32
  %95 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sB, i32 0, i32 0, i32 %3
  store i32 %94, i32 addrspace(3)* %95, align 4, !tbaa !7
  %96 = add nsw i32 %54, 2
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %97
  %99 = load i8, i8 addrspace(1)* %98, align 1, !tbaa !11, !amdgpu.noclobber !6
  %100 = zext i8 %99 to i32
  %101 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sB, i32 0, i32 1, i32 %3
  store i32 %100, i32 addrspace(3)* %101, align 4, !tbaa !7
  %102 = add nsw i32 %54, 1538
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %103
  %105 = load i8, i8 addrspace(1)* %104, align 1, !tbaa !11, !amdgpu.noclobber !6
  %106 = zext i8 %105 to i32
  %107 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sB, i32 0, i32 2, i32 %3
  store i32 %106, i32 addrspace(3)* %107, align 4, !tbaa !7
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  switch i32 %3, label %108 [
    i32 511, label %241
    i32 0, label %241
  ]

108:                                              ; preds = %53
  %109 = add nsw i32 %3, -1
  %110 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sR, i32 0, i32 0, i32 %109
  %111 = load i32, i32 addrspace(3)* %110, align 4, !tbaa !7
  %112 = load i32, i32 addrspace(3)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(3)* @_ZZ11processDataPhPiE7sfilter, i32 0, i32 0, i32 0), align 16, !tbaa !7
  %113 = mul nsw i32 %112, %111
  %114 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ11processDataPhPiE5sRsum, i32 0, i32 %3
  %115 = load i32, i32 addrspace(3)* %60, align 4, !tbaa !7
  %116 = load i32, i32 addrspace(3)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(3)* @_ZZ11processDataPhPiE7sfilter, i32 0, i32 0, i32 1), align 4, !tbaa !7
  %117 = mul nsw i32 %116, %115
  %118 = add nsw i32 %117, %113
  %119 = add nuw nsw i32 %3, 1
  %120 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sR, i32 0, i32 0, i32 %119
  %121 = load i32, i32 addrspace(3)* %120, align 4, !tbaa !7
  %122 = load i32, i32 addrspace(3)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(3)* @_ZZ11processDataPhPiE7sfilter, i32 0, i32 0, i32 2), align 8, !tbaa !7
  %123 = mul nsw i32 %122, %121
  %124 = add nsw i32 %123, %118
  %125 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sR, i32 0, i32 1, i32 %109
  %126 = load i32, i32 addrspace(3)* %125, align 4, !tbaa !7
  %127 = load i32, i32 addrspace(3)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(3)* @_ZZ11processDataPhPiE7sfilter, i32 0, i32 1, i32 0), align 4, !tbaa !7
  %128 = mul nsw i32 %127, %126
  %129 = add nsw i32 %128, %124
  %130 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !7
  %131 = load i32, i32 addrspace(3)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(3)* @_ZZ11processDataPhPiE7sfilter, i32 0, i32 1, i32 1), align 16, !tbaa !7
  %132 = mul nsw i32 %131, %130
  %133 = add nsw i32 %132, %129
  %134 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sR, i32 0, i32 1, i32 %119
  %135 = load i32, i32 addrspace(3)* %134, align 4, !tbaa !7
  %136 = load i32, i32 addrspace(3)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(3)* @_ZZ11processDataPhPiE7sfilter, i32 0, i32 1, i32 2), align 4, !tbaa !7
  %137 = mul nsw i32 %136, %135
  %138 = add nsw i32 %137, %133
  %139 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sR, i32 0, i32 2, i32 %109
  %140 = load i32, i32 addrspace(3)* %139, align 4, !tbaa !7
  %141 = load i32, i32 addrspace(3)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(3)* @_ZZ11processDataPhPiE7sfilter, i32 0, i32 2, i32 0), align 8, !tbaa !7
  %142 = mul nsw i32 %141, %140
  %143 = add nsw i32 %142, %138
  %144 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !7
  %145 = load i32, i32 addrspace(3)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(3)* @_ZZ11processDataPhPiE7sfilter, i32 0, i32 2, i32 1), align 4, !tbaa !7
  %146 = mul nsw i32 %145, %144
  %147 = add nsw i32 %146, %143
  %148 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sR, i32 0, i32 2, i32 %119
  %149 = load i32, i32 addrspace(3)* %148, align 4, !tbaa !7
  %150 = load i32, i32 addrspace(3)* getelementptr inbounds ([3 x [3 x i32]], [3 x [3 x i32]] addrspace(3)* @_ZZ11processDataPhPiE7sfilter, i32 0, i32 2, i32 2), align 16, !tbaa !7
  %151 = mul nsw i32 %150, %149
  %152 = add nsw i32 %151, %147
  %153 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sG, i32 0, i32 0, i32 %109
  %154 = load i32, i32 addrspace(3)* %153, align 4, !tbaa !7
  %155 = mul nsw i32 %154, %112
  %156 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ11processDataPhPiE5sGsum, i32 0, i32 %3
  %157 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !7
  %158 = mul nsw i32 %157, %116
  %159 = add nsw i32 %158, %155
  %160 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sG, i32 0, i32 0, i32 %119
  %161 = load i32, i32 addrspace(3)* %160, align 4, !tbaa !7
  %162 = mul nsw i32 %161, %122
  %163 = add nsw i32 %162, %159
  %164 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sG, i32 0, i32 1, i32 %109
  %165 = load i32, i32 addrspace(3)* %164, align 4, !tbaa !7
  %166 = mul nsw i32 %165, %127
  %167 = add nsw i32 %166, %163
  %168 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !7
  %169 = mul nsw i32 %168, %131
  %170 = add nsw i32 %169, %167
  %171 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sG, i32 0, i32 1, i32 %119
  %172 = load i32, i32 addrspace(3)* %171, align 4, !tbaa !7
  %173 = mul nsw i32 %172, %136
  %174 = add nsw i32 %173, %170
  %175 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sG, i32 0, i32 2, i32 %109
  %176 = load i32, i32 addrspace(3)* %175, align 4, !tbaa !7
  %177 = mul nsw i32 %176, %141
  %178 = add nsw i32 %177, %174
  %179 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !7
  %180 = mul nsw i32 %179, %145
  %181 = add nsw i32 %180, %178
  %182 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sG, i32 0, i32 2, i32 %119
  %183 = load i32, i32 addrspace(3)* %182, align 4, !tbaa !7
  %184 = mul nsw i32 %183, %150
  %185 = add nsw i32 %184, %181
  %186 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sB, i32 0, i32 0, i32 %109
  %187 = load i32, i32 addrspace(3)* %186, align 4, !tbaa !7
  %188 = mul nsw i32 %187, %112
  %189 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ11processDataPhPiE5sBsum, i32 0, i32 %3
  %190 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !7
  %191 = mul nsw i32 %190, %116
  %192 = add nsw i32 %191, %188
  %193 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sB, i32 0, i32 0, i32 %119
  %194 = load i32, i32 addrspace(3)* %193, align 4, !tbaa !7
  %195 = mul nsw i32 %194, %122
  %196 = add nsw i32 %195, %192
  %197 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sB, i32 0, i32 1, i32 %109
  %198 = load i32, i32 addrspace(3)* %197, align 4, !tbaa !7
  %199 = mul nsw i32 %198, %127
  %200 = add nsw i32 %199, %196
  %201 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !7
  %202 = mul nsw i32 %201, %131
  %203 = add nsw i32 %202, %200
  %204 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sB, i32 0, i32 1, i32 %119
  %205 = load i32, i32 addrspace(3)* %204, align 4, !tbaa !7
  %206 = mul nsw i32 %205, %136
  %207 = add nsw i32 %206, %203
  %208 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sB, i32 0, i32 2, i32 %109
  %209 = load i32, i32 addrspace(3)* %208, align 4, !tbaa !7
  %210 = mul nsw i32 %209, %141
  %211 = add nsw i32 %210, %207
  %212 = load i32, i32 addrspace(3)* %107, align 4, !tbaa !7
  %213 = mul nsw i32 %212, %145
  %214 = add nsw i32 %213, %211
  %215 = getelementptr inbounds [3 x [512 x i32]], [3 x [512 x i32]] addrspace(3)* @_ZZ11processDataPhPiE2sB, i32 0, i32 2, i32 %119
  %216 = load i32, i32 addrspace(3)* %215, align 4, !tbaa !7
  %217 = mul nsw i32 %216, %150
  %218 = add nsw i32 %217, %214
  %219 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 9
  %220 = load i32, i32 addrspace(1)* %219, align 4, !tbaa !7, !amdgpu.noclobber !6
  %221 = sdiv i32 %152, %220
  store i32 %221, i32 addrspace(3)* %114, align 4, !tbaa !7
  %222 = sdiv i32 %185, %220
  store i32 %222, i32 addrspace(3)* %156, align 4, !tbaa !7
  %223 = sdiv i32 %218, %220
  store i32 %223, i32 addrspace(3)* %189, align 4, !tbaa !7
  %224 = icmp sgt i32 %221, 255
  br i1 %224, label %227, label %225

225:                                              ; preds = %108
  %226 = icmp slt i32 %221, 0
  br i1 %226, label %227, label %229

227:                                              ; preds = %225, %108
  %228 = phi i32 [ 255, %108 ], [ 0, %225 ]
  store i32 %228, i32 addrspace(3)* %114, align 4, !tbaa !7
  br label %229

229:                                              ; preds = %227, %225
  %230 = icmp sgt i32 %222, 255
  br i1 %230, label %233, label %231

231:                                              ; preds = %229
  %232 = icmp slt i32 %222, 0
  br i1 %232, label %233, label %235

233:                                              ; preds = %231, %229
  %234 = phi i32 [ 255, %229 ], [ 0, %231 ]
  store i32 %234, i32 addrspace(3)* %156, align 4, !tbaa !7
  br label %235

235:                                              ; preds = %233, %231
  %236 = icmp sgt i32 %223, 255
  br i1 %236, label %239, label %237

237:                                              ; preds = %235
  %238 = icmp slt i32 %223, 0
  br i1 %238, label %239, label %241

239:                                              ; preds = %237, %235
  %240 = phi i32 [ 255, %235 ], [ 0, %237 ]
  store i32 %240, i32 addrspace(3)* %189, align 4, !tbaa !7
  br label %241

241:                                              ; preds = %239, %53, %53, %52, %52, %237
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %242 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ11processDataPhPiE5sRsum, i32 0, i32 %3
  %243 = load i32, i32 addrspace(3)* %242, align 4, !tbaa !7
  %244 = trunc i32 %243 to i8
  %245 = mul nsw i32 %11, 3
  %246 = sext i32 %245 to i64
  %247 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %246
  store i8 %244, i8 addrspace(1)* %247, align 1, !tbaa !11
  %248 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ11processDataPhPiE5sGsum, i32 0, i32 %3
  %249 = load i32, i32 addrspace(3)* %248, align 4, !tbaa !7
  %250 = trunc i32 %249 to i8
  %251 = add nsw i32 %245, 1
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %252
  store i8 %250, i8 addrspace(1)* %253, align 1, !tbaa !11
  %254 = getelementptr inbounds [512 x i32], [512 x i32] addrspace(3)* @_ZZ11processDataPhPiE5sBsum, i32 0, i32 %3
  %255 = load i32, i32 addrspace(3)* %254, align 4, !tbaa !7
  %256 = trunc i32 %255 to i8
  %257 = add nsw i32 %245, 2
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %258
  store i8 %256, i8 addrspace(1)* %259, align 1, !tbaa !11
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
