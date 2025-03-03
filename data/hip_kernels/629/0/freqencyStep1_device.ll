; ModuleID = '../data/hip_kernels/629/0/main.cu'
source_filename = "../data/hip_kernels/629/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ13freqencyStep1PciPiE5sfreq = internal unnamed_addr addrspace(3) global [3456 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13freqencyStep1PciPi(i8 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  br label %26

10:                                               ; preds = %26
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %11 = mul nuw nsw i32 %4, 27
  %12 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %11
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !7
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = mul i32 %16, %9
  %18 = udiv i32 %15, %9
  %19 = mul i32 %18, %9
  %20 = icmp ugt i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %9
  %24 = add i32 %17, %4
  %25 = icmp slt i32 %24, %1
  br i1 %25, label %33, label %31

26:                                               ; preds = %3, %26
  %27 = phi i32 [ %4, %3 ], [ %29, %26 ]
  %28 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %27
  store i32 0, i32 addrspace(3)* %28, align 4, !tbaa !16
  %29 = add nuw nsw i32 %27, %9
  %30 = icmp ult i32 %29, 3456
  br i1 %30, label %26, label %10, !llvm.loop !20

31:                                               ; preds = %33, %10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %32 = icmp ult i32 %4, 64
  br i1 %32, label %45, label %202

33:                                               ; preds = %10, %33
  %34 = phi i32 [ %43, %33 ], [ %24, %10 ]
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %35
  %37 = load i8, i8 addrspace(1)* %36, align 1, !tbaa !22, !amdgpu.noclobber !6
  %38 = sext i8 %37 to i32
  %39 = add nsw i32 %38, -97
  %40 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 %39
  %41 = load i32, i32 addrspace(3)* %40, align 4, !tbaa !16
  %42 = add nsw i32 %41, 1
  store i32 %42, i32 addrspace(3)* %40, align 4, !tbaa !16
  %43 = add nsw i32 %34, %23
  %44 = icmp slt i32 %43, %1
  br i1 %44, label %33, label %31, !llvm.loop !23

45:                                               ; preds = %31
  %46 = mul nuw nsw i32 %4, 27
  %47 = add nuw nsw i32 %46, 1728
  %48 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %47
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !16
  %50 = load i32, i32 addrspace(3)* %12, align 4, !tbaa !16
  %51 = add nsw i32 %50, %49
  store i32 %51, i32 addrspace(3)* %12, align 4, !tbaa !16
  %52 = add nuw nsw i32 %46, 1729
  %53 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %52
  %54 = load i32, i32 addrspace(3)* %53, align 4, !tbaa !16
  %55 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 1
  %56 = load i32, i32 addrspace(3)* %55, align 4, !tbaa !16
  %57 = add nsw i32 %56, %54
  store i32 %57, i32 addrspace(3)* %55, align 4, !tbaa !16
  %58 = add nuw nsw i32 %46, 1730
  %59 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %58
  %60 = load i32, i32 addrspace(3)* %59, align 4, !tbaa !16
  %61 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 2
  %62 = load i32, i32 addrspace(3)* %61, align 4, !tbaa !16
  %63 = add nsw i32 %62, %60
  store i32 %63, i32 addrspace(3)* %61, align 4, !tbaa !16
  %64 = add nuw nsw i32 %46, 1731
  %65 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %64
  %66 = load i32, i32 addrspace(3)* %65, align 4, !tbaa !16
  %67 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 3
  %68 = load i32, i32 addrspace(3)* %67, align 4, !tbaa !16
  %69 = add nsw i32 %68, %66
  store i32 %69, i32 addrspace(3)* %67, align 4, !tbaa !16
  %70 = add nuw nsw i32 %46, 1732
  %71 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %70
  %72 = load i32, i32 addrspace(3)* %71, align 4, !tbaa !16
  %73 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 4
  %74 = load i32, i32 addrspace(3)* %73, align 4, !tbaa !16
  %75 = add nsw i32 %74, %72
  store i32 %75, i32 addrspace(3)* %73, align 4, !tbaa !16
  %76 = add nuw nsw i32 %46, 1733
  %77 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %76
  %78 = load i32, i32 addrspace(3)* %77, align 4, !tbaa !16
  %79 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 5
  %80 = load i32, i32 addrspace(3)* %79, align 4, !tbaa !16
  %81 = add nsw i32 %80, %78
  store i32 %81, i32 addrspace(3)* %79, align 4, !tbaa !16
  %82 = add nuw nsw i32 %46, 1734
  %83 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %82
  %84 = load i32, i32 addrspace(3)* %83, align 4, !tbaa !16
  %85 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 6
  %86 = load i32, i32 addrspace(3)* %85, align 4, !tbaa !16
  %87 = add nsw i32 %86, %84
  store i32 %87, i32 addrspace(3)* %85, align 4, !tbaa !16
  %88 = add nuw nsw i32 %46, 1735
  %89 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %88
  %90 = load i32, i32 addrspace(3)* %89, align 4, !tbaa !16
  %91 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 7
  %92 = load i32, i32 addrspace(3)* %91, align 4, !tbaa !16
  %93 = add nsw i32 %92, %90
  store i32 %93, i32 addrspace(3)* %91, align 4, !tbaa !16
  %94 = add nuw nsw i32 %46, 1736
  %95 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %94
  %96 = load i32, i32 addrspace(3)* %95, align 4, !tbaa !16
  %97 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 8
  %98 = load i32, i32 addrspace(3)* %97, align 4, !tbaa !16
  %99 = add nsw i32 %98, %96
  store i32 %99, i32 addrspace(3)* %97, align 4, !tbaa !16
  %100 = add nuw nsw i32 %46, 1737
  %101 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %100
  %102 = load i32, i32 addrspace(3)* %101, align 4, !tbaa !16
  %103 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 9
  %104 = load i32, i32 addrspace(3)* %103, align 4, !tbaa !16
  %105 = add nsw i32 %104, %102
  store i32 %105, i32 addrspace(3)* %103, align 4, !tbaa !16
  %106 = add nuw nsw i32 %46, 1738
  %107 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %106
  %108 = load i32, i32 addrspace(3)* %107, align 4, !tbaa !16
  %109 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 10
  %110 = load i32, i32 addrspace(3)* %109, align 4, !tbaa !16
  %111 = add nsw i32 %110, %108
  store i32 %111, i32 addrspace(3)* %109, align 4, !tbaa !16
  %112 = add nuw nsw i32 %46, 1739
  %113 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %112
  %114 = load i32, i32 addrspace(3)* %113, align 4, !tbaa !16
  %115 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 11
  %116 = load i32, i32 addrspace(3)* %115, align 4, !tbaa !16
  %117 = add nsw i32 %116, %114
  store i32 %117, i32 addrspace(3)* %115, align 4, !tbaa !16
  %118 = add nuw nsw i32 %46, 1740
  %119 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %118
  %120 = load i32, i32 addrspace(3)* %119, align 4, !tbaa !16
  %121 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 12
  %122 = load i32, i32 addrspace(3)* %121, align 4, !tbaa !16
  %123 = add nsw i32 %122, %120
  store i32 %123, i32 addrspace(3)* %121, align 4, !tbaa !16
  %124 = add nuw nsw i32 %46, 1741
  %125 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %124
  %126 = load i32, i32 addrspace(3)* %125, align 4, !tbaa !16
  %127 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 13
  %128 = load i32, i32 addrspace(3)* %127, align 4, !tbaa !16
  %129 = add nsw i32 %128, %126
  store i32 %129, i32 addrspace(3)* %127, align 4, !tbaa !16
  %130 = add nuw nsw i32 %46, 1742
  %131 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %130
  %132 = load i32, i32 addrspace(3)* %131, align 4, !tbaa !16
  %133 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 14
  %134 = load i32, i32 addrspace(3)* %133, align 4, !tbaa !16
  %135 = add nsw i32 %134, %132
  store i32 %135, i32 addrspace(3)* %133, align 4, !tbaa !16
  %136 = add nuw nsw i32 %46, 1743
  %137 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %136
  %138 = load i32, i32 addrspace(3)* %137, align 4, !tbaa !16
  %139 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 15
  %140 = load i32, i32 addrspace(3)* %139, align 4, !tbaa !16
  %141 = add nsw i32 %140, %138
  store i32 %141, i32 addrspace(3)* %139, align 4, !tbaa !16
  %142 = add nuw nsw i32 %46, 1744
  %143 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %142
  %144 = load i32, i32 addrspace(3)* %143, align 4, !tbaa !16
  %145 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 16
  %146 = load i32, i32 addrspace(3)* %145, align 4, !tbaa !16
  %147 = add nsw i32 %146, %144
  store i32 %147, i32 addrspace(3)* %145, align 4, !tbaa !16
  %148 = add nuw nsw i32 %46, 1745
  %149 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %148
  %150 = load i32, i32 addrspace(3)* %149, align 4, !tbaa !16
  %151 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 17
  %152 = load i32, i32 addrspace(3)* %151, align 4, !tbaa !16
  %153 = add nsw i32 %152, %150
  store i32 %153, i32 addrspace(3)* %151, align 4, !tbaa !16
  %154 = add nuw nsw i32 %46, 1746
  %155 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %154
  %156 = load i32, i32 addrspace(3)* %155, align 4, !tbaa !16
  %157 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 18
  %158 = load i32, i32 addrspace(3)* %157, align 4, !tbaa !16
  %159 = add nsw i32 %158, %156
  store i32 %159, i32 addrspace(3)* %157, align 4, !tbaa !16
  %160 = add nuw nsw i32 %46, 1747
  %161 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %160
  %162 = load i32, i32 addrspace(3)* %161, align 4, !tbaa !16
  %163 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 19
  %164 = load i32, i32 addrspace(3)* %163, align 4, !tbaa !16
  %165 = add nsw i32 %164, %162
  store i32 %165, i32 addrspace(3)* %163, align 4, !tbaa !16
  %166 = add nuw nsw i32 %46, 1748
  %167 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %166
  %168 = load i32, i32 addrspace(3)* %167, align 4, !tbaa !16
  %169 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 20
  %170 = load i32, i32 addrspace(3)* %169, align 4, !tbaa !16
  %171 = add nsw i32 %170, %168
  store i32 %171, i32 addrspace(3)* %169, align 4, !tbaa !16
  %172 = add nuw nsw i32 %46, 1749
  %173 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %172
  %174 = load i32, i32 addrspace(3)* %173, align 4, !tbaa !16
  %175 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 21
  %176 = load i32, i32 addrspace(3)* %175, align 4, !tbaa !16
  %177 = add nsw i32 %176, %174
  store i32 %177, i32 addrspace(3)* %175, align 4, !tbaa !16
  %178 = add nuw nsw i32 %46, 1750
  %179 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %178
  %180 = load i32, i32 addrspace(3)* %179, align 4, !tbaa !16
  %181 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 22
  %182 = load i32, i32 addrspace(3)* %181, align 4, !tbaa !16
  %183 = add nsw i32 %182, %180
  store i32 %183, i32 addrspace(3)* %181, align 4, !tbaa !16
  %184 = add nuw nsw i32 %46, 1751
  %185 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %184
  %186 = load i32, i32 addrspace(3)* %185, align 4, !tbaa !16
  %187 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 23
  %188 = load i32, i32 addrspace(3)* %187, align 4, !tbaa !16
  %189 = add nsw i32 %188, %186
  store i32 %189, i32 addrspace(3)* %187, align 4, !tbaa !16
  %190 = add nuw nsw i32 %46, 1752
  %191 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %190
  %192 = load i32, i32 addrspace(3)* %191, align 4, !tbaa !16
  %193 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 24
  %194 = load i32, i32 addrspace(3)* %193, align 4, !tbaa !16
  %195 = add nsw i32 %194, %192
  store i32 %195, i32 addrspace(3)* %193, align 4, !tbaa !16
  %196 = add nuw nsw i32 %46, 1753
  %197 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %196
  %198 = load i32, i32 addrspace(3)* %197, align 4, !tbaa !16
  %199 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 25
  %200 = load i32, i32 addrspace(3)* %199, align 4, !tbaa !16
  %201 = add nsw i32 %200, %198
  store i32 %201, i32 addrspace(3)* %199, align 4, !tbaa !16
  br label %202

202:                                              ; preds = %45, %31
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %203 = icmp ult i32 %4, 32
  br i1 %203, label %204, label %361

204:                                              ; preds = %202
  %205 = mul nuw nsw i32 %4, 27
  %206 = add nuw nsw i32 %205, 864
  %207 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %206
  %208 = load i32, i32 addrspace(3)* %207, align 4, !tbaa !16
  %209 = load i32, i32 addrspace(3)* %12, align 4, !tbaa !16
  %210 = add nsw i32 %209, %208
  store i32 %210, i32 addrspace(3)* %12, align 4, !tbaa !16
  %211 = add nuw nsw i32 %205, 865
  %212 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %211
  %213 = load i32, i32 addrspace(3)* %212, align 4, !tbaa !16
  %214 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 1
  %215 = load i32, i32 addrspace(3)* %214, align 4, !tbaa !16
  %216 = add nsw i32 %215, %213
  store i32 %216, i32 addrspace(3)* %214, align 4, !tbaa !16
  %217 = add nuw nsw i32 %205, 866
  %218 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %217
  %219 = load i32, i32 addrspace(3)* %218, align 4, !tbaa !16
  %220 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 2
  %221 = load i32, i32 addrspace(3)* %220, align 4, !tbaa !16
  %222 = add nsw i32 %221, %219
  store i32 %222, i32 addrspace(3)* %220, align 4, !tbaa !16
  %223 = add nuw nsw i32 %205, 867
  %224 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %223
  %225 = load i32, i32 addrspace(3)* %224, align 4, !tbaa !16
  %226 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 3
  %227 = load i32, i32 addrspace(3)* %226, align 4, !tbaa !16
  %228 = add nsw i32 %227, %225
  store i32 %228, i32 addrspace(3)* %226, align 4, !tbaa !16
  %229 = add nuw nsw i32 %205, 868
  %230 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %229
  %231 = load i32, i32 addrspace(3)* %230, align 4, !tbaa !16
  %232 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 4
  %233 = load i32, i32 addrspace(3)* %232, align 4, !tbaa !16
  %234 = add nsw i32 %233, %231
  store i32 %234, i32 addrspace(3)* %232, align 4, !tbaa !16
  %235 = add nuw nsw i32 %205, 869
  %236 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %235
  %237 = load i32, i32 addrspace(3)* %236, align 4, !tbaa !16
  %238 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 5
  %239 = load i32, i32 addrspace(3)* %238, align 4, !tbaa !16
  %240 = add nsw i32 %239, %237
  store i32 %240, i32 addrspace(3)* %238, align 4, !tbaa !16
  %241 = add nuw nsw i32 %205, 870
  %242 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %241
  %243 = load i32, i32 addrspace(3)* %242, align 4, !tbaa !16
  %244 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 6
  %245 = load i32, i32 addrspace(3)* %244, align 4, !tbaa !16
  %246 = add nsw i32 %245, %243
  store i32 %246, i32 addrspace(3)* %244, align 4, !tbaa !16
  %247 = add nuw nsw i32 %205, 871
  %248 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %247
  %249 = load i32, i32 addrspace(3)* %248, align 4, !tbaa !16
  %250 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 7
  %251 = load i32, i32 addrspace(3)* %250, align 4, !tbaa !16
  %252 = add nsw i32 %251, %249
  store i32 %252, i32 addrspace(3)* %250, align 4, !tbaa !16
  %253 = add nuw nsw i32 %205, 872
  %254 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %253
  %255 = load i32, i32 addrspace(3)* %254, align 4, !tbaa !16
  %256 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 8
  %257 = load i32, i32 addrspace(3)* %256, align 4, !tbaa !16
  %258 = add nsw i32 %257, %255
  store i32 %258, i32 addrspace(3)* %256, align 4, !tbaa !16
  %259 = add nuw nsw i32 %205, 873
  %260 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %259
  %261 = load i32, i32 addrspace(3)* %260, align 4, !tbaa !16
  %262 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 9
  %263 = load i32, i32 addrspace(3)* %262, align 4, !tbaa !16
  %264 = add nsw i32 %263, %261
  store i32 %264, i32 addrspace(3)* %262, align 4, !tbaa !16
  %265 = add nuw nsw i32 %205, 874
  %266 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %265
  %267 = load i32, i32 addrspace(3)* %266, align 4, !tbaa !16
  %268 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 10
  %269 = load i32, i32 addrspace(3)* %268, align 4, !tbaa !16
  %270 = add nsw i32 %269, %267
  store i32 %270, i32 addrspace(3)* %268, align 4, !tbaa !16
  %271 = add nuw nsw i32 %205, 875
  %272 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %271
  %273 = load i32, i32 addrspace(3)* %272, align 4, !tbaa !16
  %274 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 11
  %275 = load i32, i32 addrspace(3)* %274, align 4, !tbaa !16
  %276 = add nsw i32 %275, %273
  store i32 %276, i32 addrspace(3)* %274, align 4, !tbaa !16
  %277 = add nuw nsw i32 %205, 876
  %278 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %277
  %279 = load i32, i32 addrspace(3)* %278, align 4, !tbaa !16
  %280 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 12
  %281 = load i32, i32 addrspace(3)* %280, align 4, !tbaa !16
  %282 = add nsw i32 %281, %279
  store i32 %282, i32 addrspace(3)* %280, align 4, !tbaa !16
  %283 = add nuw nsw i32 %205, 877
  %284 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %283
  %285 = load i32, i32 addrspace(3)* %284, align 4, !tbaa !16
  %286 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 13
  %287 = load i32, i32 addrspace(3)* %286, align 4, !tbaa !16
  %288 = add nsw i32 %287, %285
  store i32 %288, i32 addrspace(3)* %286, align 4, !tbaa !16
  %289 = add nuw nsw i32 %205, 878
  %290 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %289
  %291 = load i32, i32 addrspace(3)* %290, align 4, !tbaa !16
  %292 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 14
  %293 = load i32, i32 addrspace(3)* %292, align 4, !tbaa !16
  %294 = add nsw i32 %293, %291
  store i32 %294, i32 addrspace(3)* %292, align 4, !tbaa !16
  %295 = add nuw nsw i32 %205, 879
  %296 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %295
  %297 = load i32, i32 addrspace(3)* %296, align 4, !tbaa !16
  %298 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 15
  %299 = load i32, i32 addrspace(3)* %298, align 4, !tbaa !16
  %300 = add nsw i32 %299, %297
  store i32 %300, i32 addrspace(3)* %298, align 4, !tbaa !16
  %301 = add nuw nsw i32 %205, 880
  %302 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %301
  %303 = load i32, i32 addrspace(3)* %302, align 4, !tbaa !16
  %304 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 16
  %305 = load i32, i32 addrspace(3)* %304, align 4, !tbaa !16
  %306 = add nsw i32 %305, %303
  store i32 %306, i32 addrspace(3)* %304, align 4, !tbaa !16
  %307 = add nuw nsw i32 %205, 881
  %308 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %307
  %309 = load i32, i32 addrspace(3)* %308, align 4, !tbaa !16
  %310 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 17
  %311 = load i32, i32 addrspace(3)* %310, align 4, !tbaa !16
  %312 = add nsw i32 %311, %309
  store i32 %312, i32 addrspace(3)* %310, align 4, !tbaa !16
  %313 = add nuw nsw i32 %205, 882
  %314 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %313
  %315 = load i32, i32 addrspace(3)* %314, align 4, !tbaa !16
  %316 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 18
  %317 = load i32, i32 addrspace(3)* %316, align 4, !tbaa !16
  %318 = add nsw i32 %317, %315
  store i32 %318, i32 addrspace(3)* %316, align 4, !tbaa !16
  %319 = add nuw nsw i32 %205, 883
  %320 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %319
  %321 = load i32, i32 addrspace(3)* %320, align 4, !tbaa !16
  %322 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 19
  %323 = load i32, i32 addrspace(3)* %322, align 4, !tbaa !16
  %324 = add nsw i32 %323, %321
  store i32 %324, i32 addrspace(3)* %322, align 4, !tbaa !16
  %325 = add nuw nsw i32 %205, 884
  %326 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %325
  %327 = load i32, i32 addrspace(3)* %326, align 4, !tbaa !16
  %328 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 20
  %329 = load i32, i32 addrspace(3)* %328, align 4, !tbaa !16
  %330 = add nsw i32 %329, %327
  store i32 %330, i32 addrspace(3)* %328, align 4, !tbaa !16
  %331 = add nuw nsw i32 %205, 885
  %332 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %331
  %333 = load i32, i32 addrspace(3)* %332, align 4, !tbaa !16
  %334 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 21
  %335 = load i32, i32 addrspace(3)* %334, align 4, !tbaa !16
  %336 = add nsw i32 %335, %333
  store i32 %336, i32 addrspace(3)* %334, align 4, !tbaa !16
  %337 = add nuw nsw i32 %205, 886
  %338 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %337
  %339 = load i32, i32 addrspace(3)* %338, align 4, !tbaa !16
  %340 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 22
  %341 = load i32, i32 addrspace(3)* %340, align 4, !tbaa !16
  %342 = add nsw i32 %341, %339
  store i32 %342, i32 addrspace(3)* %340, align 4, !tbaa !16
  %343 = add nuw nsw i32 %205, 887
  %344 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %343
  %345 = load i32, i32 addrspace(3)* %344, align 4, !tbaa !16
  %346 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 23
  %347 = load i32, i32 addrspace(3)* %346, align 4, !tbaa !16
  %348 = add nsw i32 %347, %345
  store i32 %348, i32 addrspace(3)* %346, align 4, !tbaa !16
  %349 = add nuw nsw i32 %205, 888
  %350 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %349
  %351 = load i32, i32 addrspace(3)* %350, align 4, !tbaa !16
  %352 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 24
  %353 = load i32, i32 addrspace(3)* %352, align 4, !tbaa !16
  %354 = add nsw i32 %353, %351
  store i32 %354, i32 addrspace(3)* %352, align 4, !tbaa !16
  %355 = add nuw nsw i32 %205, 889
  %356 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %355
  %357 = load i32, i32 addrspace(3)* %356, align 4, !tbaa !16
  %358 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 25
  %359 = load i32, i32 addrspace(3)* %358, align 4, !tbaa !16
  %360 = add nsw i32 %359, %357
  store i32 %360, i32 addrspace(3)* %358, align 4, !tbaa !16
  br label %361

361:                                              ; preds = %204, %202
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %362 = icmp ult i32 %4, 16
  br i1 %362, label %363, label %520

363:                                              ; preds = %361
  %364 = mul nuw nsw i32 %4, 27
  %365 = add nuw nsw i32 %364, 432
  %366 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %365
  %367 = load i32, i32 addrspace(3)* %366, align 4, !tbaa !16
  %368 = load i32, i32 addrspace(3)* %12, align 4, !tbaa !16
  %369 = add nsw i32 %368, %367
  store i32 %369, i32 addrspace(3)* %12, align 4, !tbaa !16
  %370 = add nuw nsw i32 %364, 433
  %371 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %370
  %372 = load i32, i32 addrspace(3)* %371, align 4, !tbaa !16
  %373 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 1
  %374 = load i32, i32 addrspace(3)* %373, align 4, !tbaa !16
  %375 = add nsw i32 %374, %372
  store i32 %375, i32 addrspace(3)* %373, align 4, !tbaa !16
  %376 = add nuw nsw i32 %364, 434
  %377 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %376
  %378 = load i32, i32 addrspace(3)* %377, align 4, !tbaa !16
  %379 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 2
  %380 = load i32, i32 addrspace(3)* %379, align 4, !tbaa !16
  %381 = add nsw i32 %380, %378
  store i32 %381, i32 addrspace(3)* %379, align 4, !tbaa !16
  %382 = add nuw nsw i32 %364, 435
  %383 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %382
  %384 = load i32, i32 addrspace(3)* %383, align 4, !tbaa !16
  %385 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 3
  %386 = load i32, i32 addrspace(3)* %385, align 4, !tbaa !16
  %387 = add nsw i32 %386, %384
  store i32 %387, i32 addrspace(3)* %385, align 4, !tbaa !16
  %388 = add nuw nsw i32 %364, 436
  %389 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %388
  %390 = load i32, i32 addrspace(3)* %389, align 4, !tbaa !16
  %391 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 4
  %392 = load i32, i32 addrspace(3)* %391, align 4, !tbaa !16
  %393 = add nsw i32 %392, %390
  store i32 %393, i32 addrspace(3)* %391, align 4, !tbaa !16
  %394 = add nuw nsw i32 %364, 437
  %395 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %394
  %396 = load i32, i32 addrspace(3)* %395, align 4, !tbaa !16
  %397 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 5
  %398 = load i32, i32 addrspace(3)* %397, align 4, !tbaa !16
  %399 = add nsw i32 %398, %396
  store i32 %399, i32 addrspace(3)* %397, align 4, !tbaa !16
  %400 = add nuw nsw i32 %364, 438
  %401 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %400
  %402 = load i32, i32 addrspace(3)* %401, align 4, !tbaa !16
  %403 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 6
  %404 = load i32, i32 addrspace(3)* %403, align 4, !tbaa !16
  %405 = add nsw i32 %404, %402
  store i32 %405, i32 addrspace(3)* %403, align 4, !tbaa !16
  %406 = add nuw nsw i32 %364, 439
  %407 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %406
  %408 = load i32, i32 addrspace(3)* %407, align 4, !tbaa !16
  %409 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 7
  %410 = load i32, i32 addrspace(3)* %409, align 4, !tbaa !16
  %411 = add nsw i32 %410, %408
  store i32 %411, i32 addrspace(3)* %409, align 4, !tbaa !16
  %412 = add nuw nsw i32 %364, 440
  %413 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %412
  %414 = load i32, i32 addrspace(3)* %413, align 4, !tbaa !16
  %415 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 8
  %416 = load i32, i32 addrspace(3)* %415, align 4, !tbaa !16
  %417 = add nsw i32 %416, %414
  store i32 %417, i32 addrspace(3)* %415, align 4, !tbaa !16
  %418 = add nuw nsw i32 %364, 441
  %419 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %418
  %420 = load i32, i32 addrspace(3)* %419, align 4, !tbaa !16
  %421 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 9
  %422 = load i32, i32 addrspace(3)* %421, align 4, !tbaa !16
  %423 = add nsw i32 %422, %420
  store i32 %423, i32 addrspace(3)* %421, align 4, !tbaa !16
  %424 = add nuw nsw i32 %364, 442
  %425 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %424
  %426 = load i32, i32 addrspace(3)* %425, align 4, !tbaa !16
  %427 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 10
  %428 = load i32, i32 addrspace(3)* %427, align 4, !tbaa !16
  %429 = add nsw i32 %428, %426
  store i32 %429, i32 addrspace(3)* %427, align 4, !tbaa !16
  %430 = add nuw nsw i32 %364, 443
  %431 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %430
  %432 = load i32, i32 addrspace(3)* %431, align 4, !tbaa !16
  %433 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 11
  %434 = load i32, i32 addrspace(3)* %433, align 4, !tbaa !16
  %435 = add nsw i32 %434, %432
  store i32 %435, i32 addrspace(3)* %433, align 4, !tbaa !16
  %436 = add nuw nsw i32 %364, 444
  %437 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %436
  %438 = load i32, i32 addrspace(3)* %437, align 4, !tbaa !16
  %439 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 12
  %440 = load i32, i32 addrspace(3)* %439, align 4, !tbaa !16
  %441 = add nsw i32 %440, %438
  store i32 %441, i32 addrspace(3)* %439, align 4, !tbaa !16
  %442 = add nuw nsw i32 %364, 445
  %443 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %442
  %444 = load i32, i32 addrspace(3)* %443, align 4, !tbaa !16
  %445 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 13
  %446 = load i32, i32 addrspace(3)* %445, align 4, !tbaa !16
  %447 = add nsw i32 %446, %444
  store i32 %447, i32 addrspace(3)* %445, align 4, !tbaa !16
  %448 = add nuw nsw i32 %364, 446
  %449 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %448
  %450 = load i32, i32 addrspace(3)* %449, align 4, !tbaa !16
  %451 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 14
  %452 = load i32, i32 addrspace(3)* %451, align 4, !tbaa !16
  %453 = add nsw i32 %452, %450
  store i32 %453, i32 addrspace(3)* %451, align 4, !tbaa !16
  %454 = add nuw nsw i32 %364, 447
  %455 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %454
  %456 = load i32, i32 addrspace(3)* %455, align 4, !tbaa !16
  %457 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 15
  %458 = load i32, i32 addrspace(3)* %457, align 4, !tbaa !16
  %459 = add nsw i32 %458, %456
  store i32 %459, i32 addrspace(3)* %457, align 4, !tbaa !16
  %460 = add nuw nsw i32 %364, 448
  %461 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %460
  %462 = load i32, i32 addrspace(3)* %461, align 4, !tbaa !16
  %463 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 16
  %464 = load i32, i32 addrspace(3)* %463, align 4, !tbaa !16
  %465 = add nsw i32 %464, %462
  store i32 %465, i32 addrspace(3)* %463, align 4, !tbaa !16
  %466 = add nuw nsw i32 %364, 449
  %467 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %466
  %468 = load i32, i32 addrspace(3)* %467, align 4, !tbaa !16
  %469 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 17
  %470 = load i32, i32 addrspace(3)* %469, align 4, !tbaa !16
  %471 = add nsw i32 %470, %468
  store i32 %471, i32 addrspace(3)* %469, align 4, !tbaa !16
  %472 = add nuw nsw i32 %364, 450
  %473 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %472
  %474 = load i32, i32 addrspace(3)* %473, align 4, !tbaa !16
  %475 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 18
  %476 = load i32, i32 addrspace(3)* %475, align 4, !tbaa !16
  %477 = add nsw i32 %476, %474
  store i32 %477, i32 addrspace(3)* %475, align 4, !tbaa !16
  %478 = add nuw nsw i32 %364, 451
  %479 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %478
  %480 = load i32, i32 addrspace(3)* %479, align 4, !tbaa !16
  %481 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 19
  %482 = load i32, i32 addrspace(3)* %481, align 4, !tbaa !16
  %483 = add nsw i32 %482, %480
  store i32 %483, i32 addrspace(3)* %481, align 4, !tbaa !16
  %484 = add nuw nsw i32 %364, 452
  %485 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %484
  %486 = load i32, i32 addrspace(3)* %485, align 4, !tbaa !16
  %487 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 20
  %488 = load i32, i32 addrspace(3)* %487, align 4, !tbaa !16
  %489 = add nsw i32 %488, %486
  store i32 %489, i32 addrspace(3)* %487, align 4, !tbaa !16
  %490 = add nuw nsw i32 %364, 453
  %491 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %490
  %492 = load i32, i32 addrspace(3)* %491, align 4, !tbaa !16
  %493 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 21
  %494 = load i32, i32 addrspace(3)* %493, align 4, !tbaa !16
  %495 = add nsw i32 %494, %492
  store i32 %495, i32 addrspace(3)* %493, align 4, !tbaa !16
  %496 = add nuw nsw i32 %364, 454
  %497 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %496
  %498 = load i32, i32 addrspace(3)* %497, align 4, !tbaa !16
  %499 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 22
  %500 = load i32, i32 addrspace(3)* %499, align 4, !tbaa !16
  %501 = add nsw i32 %500, %498
  store i32 %501, i32 addrspace(3)* %499, align 4, !tbaa !16
  %502 = add nuw nsw i32 %364, 455
  %503 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %502
  %504 = load i32, i32 addrspace(3)* %503, align 4, !tbaa !16
  %505 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 23
  %506 = load i32, i32 addrspace(3)* %505, align 4, !tbaa !16
  %507 = add nsw i32 %506, %504
  store i32 %507, i32 addrspace(3)* %505, align 4, !tbaa !16
  %508 = add nuw nsw i32 %364, 456
  %509 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %508
  %510 = load i32, i32 addrspace(3)* %509, align 4, !tbaa !16
  %511 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 24
  %512 = load i32, i32 addrspace(3)* %511, align 4, !tbaa !16
  %513 = add nsw i32 %512, %510
  store i32 %513, i32 addrspace(3)* %511, align 4, !tbaa !16
  %514 = add nuw nsw i32 %364, 457
  %515 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %514
  %516 = load i32, i32 addrspace(3)* %515, align 4, !tbaa !16
  %517 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 25
  %518 = load i32, i32 addrspace(3)* %517, align 4, !tbaa !16
  %519 = add nsw i32 %518, %516
  store i32 %519, i32 addrspace(3)* %517, align 4, !tbaa !16
  br label %520

520:                                              ; preds = %363, %361
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %521 = icmp ult i32 %4, 8
  br i1 %521, label %522, label %679

522:                                              ; preds = %520
  %523 = mul nuw nsw i32 %4, 27
  %524 = add nuw nsw i32 %523, 216
  %525 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %524
  %526 = load i32, i32 addrspace(3)* %525, align 4, !tbaa !16
  %527 = load i32, i32 addrspace(3)* %12, align 4, !tbaa !16
  %528 = add nsw i32 %527, %526
  store i32 %528, i32 addrspace(3)* %12, align 4, !tbaa !16
  %529 = add nuw nsw i32 %523, 217
  %530 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %529
  %531 = load i32, i32 addrspace(3)* %530, align 4, !tbaa !16
  %532 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 1
  %533 = load i32, i32 addrspace(3)* %532, align 4, !tbaa !16
  %534 = add nsw i32 %533, %531
  store i32 %534, i32 addrspace(3)* %532, align 4, !tbaa !16
  %535 = add nuw nsw i32 %523, 218
  %536 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %535
  %537 = load i32, i32 addrspace(3)* %536, align 4, !tbaa !16
  %538 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 2
  %539 = load i32, i32 addrspace(3)* %538, align 4, !tbaa !16
  %540 = add nsw i32 %539, %537
  store i32 %540, i32 addrspace(3)* %538, align 4, !tbaa !16
  %541 = add nuw nsw i32 %523, 219
  %542 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %541
  %543 = load i32, i32 addrspace(3)* %542, align 4, !tbaa !16
  %544 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 3
  %545 = load i32, i32 addrspace(3)* %544, align 4, !tbaa !16
  %546 = add nsw i32 %545, %543
  store i32 %546, i32 addrspace(3)* %544, align 4, !tbaa !16
  %547 = add nuw nsw i32 %523, 220
  %548 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %547
  %549 = load i32, i32 addrspace(3)* %548, align 4, !tbaa !16
  %550 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 4
  %551 = load i32, i32 addrspace(3)* %550, align 4, !tbaa !16
  %552 = add nsw i32 %551, %549
  store i32 %552, i32 addrspace(3)* %550, align 4, !tbaa !16
  %553 = add nuw nsw i32 %523, 221
  %554 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %553
  %555 = load i32, i32 addrspace(3)* %554, align 4, !tbaa !16
  %556 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 5
  %557 = load i32, i32 addrspace(3)* %556, align 4, !tbaa !16
  %558 = add nsw i32 %557, %555
  store i32 %558, i32 addrspace(3)* %556, align 4, !tbaa !16
  %559 = add nuw nsw i32 %523, 222
  %560 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %559
  %561 = load i32, i32 addrspace(3)* %560, align 4, !tbaa !16
  %562 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 6
  %563 = load i32, i32 addrspace(3)* %562, align 4, !tbaa !16
  %564 = add nsw i32 %563, %561
  store i32 %564, i32 addrspace(3)* %562, align 4, !tbaa !16
  %565 = add nuw nsw i32 %523, 223
  %566 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %565
  %567 = load i32, i32 addrspace(3)* %566, align 4, !tbaa !16
  %568 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 7
  %569 = load i32, i32 addrspace(3)* %568, align 4, !tbaa !16
  %570 = add nsw i32 %569, %567
  store i32 %570, i32 addrspace(3)* %568, align 4, !tbaa !16
  %571 = add nuw nsw i32 %523, 224
  %572 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %571
  %573 = load i32, i32 addrspace(3)* %572, align 4, !tbaa !16
  %574 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 8
  %575 = load i32, i32 addrspace(3)* %574, align 4, !tbaa !16
  %576 = add nsw i32 %575, %573
  store i32 %576, i32 addrspace(3)* %574, align 4, !tbaa !16
  %577 = add nuw nsw i32 %523, 225
  %578 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %577
  %579 = load i32, i32 addrspace(3)* %578, align 4, !tbaa !16
  %580 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 9
  %581 = load i32, i32 addrspace(3)* %580, align 4, !tbaa !16
  %582 = add nsw i32 %581, %579
  store i32 %582, i32 addrspace(3)* %580, align 4, !tbaa !16
  %583 = add nuw nsw i32 %523, 226
  %584 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %583
  %585 = load i32, i32 addrspace(3)* %584, align 4, !tbaa !16
  %586 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 10
  %587 = load i32, i32 addrspace(3)* %586, align 4, !tbaa !16
  %588 = add nsw i32 %587, %585
  store i32 %588, i32 addrspace(3)* %586, align 4, !tbaa !16
  %589 = add nuw nsw i32 %523, 227
  %590 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %589
  %591 = load i32, i32 addrspace(3)* %590, align 4, !tbaa !16
  %592 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 11
  %593 = load i32, i32 addrspace(3)* %592, align 4, !tbaa !16
  %594 = add nsw i32 %593, %591
  store i32 %594, i32 addrspace(3)* %592, align 4, !tbaa !16
  %595 = add nuw nsw i32 %523, 228
  %596 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %595
  %597 = load i32, i32 addrspace(3)* %596, align 4, !tbaa !16
  %598 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 12
  %599 = load i32, i32 addrspace(3)* %598, align 4, !tbaa !16
  %600 = add nsw i32 %599, %597
  store i32 %600, i32 addrspace(3)* %598, align 4, !tbaa !16
  %601 = add nuw nsw i32 %523, 229
  %602 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %601
  %603 = load i32, i32 addrspace(3)* %602, align 4, !tbaa !16
  %604 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 13
  %605 = load i32, i32 addrspace(3)* %604, align 4, !tbaa !16
  %606 = add nsw i32 %605, %603
  store i32 %606, i32 addrspace(3)* %604, align 4, !tbaa !16
  %607 = add nuw nsw i32 %523, 230
  %608 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %607
  %609 = load i32, i32 addrspace(3)* %608, align 4, !tbaa !16
  %610 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 14
  %611 = load i32, i32 addrspace(3)* %610, align 4, !tbaa !16
  %612 = add nsw i32 %611, %609
  store i32 %612, i32 addrspace(3)* %610, align 4, !tbaa !16
  %613 = add nuw nsw i32 %523, 231
  %614 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %613
  %615 = load i32, i32 addrspace(3)* %614, align 4, !tbaa !16
  %616 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 15
  %617 = load i32, i32 addrspace(3)* %616, align 4, !tbaa !16
  %618 = add nsw i32 %617, %615
  store i32 %618, i32 addrspace(3)* %616, align 4, !tbaa !16
  %619 = add nuw nsw i32 %523, 232
  %620 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %619
  %621 = load i32, i32 addrspace(3)* %620, align 4, !tbaa !16
  %622 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 16
  %623 = load i32, i32 addrspace(3)* %622, align 4, !tbaa !16
  %624 = add nsw i32 %623, %621
  store i32 %624, i32 addrspace(3)* %622, align 4, !tbaa !16
  %625 = add nuw nsw i32 %523, 233
  %626 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %625
  %627 = load i32, i32 addrspace(3)* %626, align 4, !tbaa !16
  %628 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 17
  %629 = load i32, i32 addrspace(3)* %628, align 4, !tbaa !16
  %630 = add nsw i32 %629, %627
  store i32 %630, i32 addrspace(3)* %628, align 4, !tbaa !16
  %631 = add nuw nsw i32 %523, 234
  %632 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %631
  %633 = load i32, i32 addrspace(3)* %632, align 4, !tbaa !16
  %634 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 18
  %635 = load i32, i32 addrspace(3)* %634, align 4, !tbaa !16
  %636 = add nsw i32 %635, %633
  store i32 %636, i32 addrspace(3)* %634, align 4, !tbaa !16
  %637 = add nuw nsw i32 %523, 235
  %638 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %637
  %639 = load i32, i32 addrspace(3)* %638, align 4, !tbaa !16
  %640 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 19
  %641 = load i32, i32 addrspace(3)* %640, align 4, !tbaa !16
  %642 = add nsw i32 %641, %639
  store i32 %642, i32 addrspace(3)* %640, align 4, !tbaa !16
  %643 = add nuw nsw i32 %523, 236
  %644 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %643
  %645 = load i32, i32 addrspace(3)* %644, align 4, !tbaa !16
  %646 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 20
  %647 = load i32, i32 addrspace(3)* %646, align 4, !tbaa !16
  %648 = add nsw i32 %647, %645
  store i32 %648, i32 addrspace(3)* %646, align 4, !tbaa !16
  %649 = add nuw nsw i32 %523, 237
  %650 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %649
  %651 = load i32, i32 addrspace(3)* %650, align 4, !tbaa !16
  %652 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 21
  %653 = load i32, i32 addrspace(3)* %652, align 4, !tbaa !16
  %654 = add nsw i32 %653, %651
  store i32 %654, i32 addrspace(3)* %652, align 4, !tbaa !16
  %655 = add nuw nsw i32 %523, 238
  %656 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %655
  %657 = load i32, i32 addrspace(3)* %656, align 4, !tbaa !16
  %658 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 22
  %659 = load i32, i32 addrspace(3)* %658, align 4, !tbaa !16
  %660 = add nsw i32 %659, %657
  store i32 %660, i32 addrspace(3)* %658, align 4, !tbaa !16
  %661 = add nuw nsw i32 %523, 239
  %662 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %661
  %663 = load i32, i32 addrspace(3)* %662, align 4, !tbaa !16
  %664 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 23
  %665 = load i32, i32 addrspace(3)* %664, align 4, !tbaa !16
  %666 = add nsw i32 %665, %663
  store i32 %666, i32 addrspace(3)* %664, align 4, !tbaa !16
  %667 = add nuw nsw i32 %523, 240
  %668 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %667
  %669 = load i32, i32 addrspace(3)* %668, align 4, !tbaa !16
  %670 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 24
  %671 = load i32, i32 addrspace(3)* %670, align 4, !tbaa !16
  %672 = add nsw i32 %671, %669
  store i32 %672, i32 addrspace(3)* %670, align 4, !tbaa !16
  %673 = add nuw nsw i32 %523, 241
  %674 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %673
  %675 = load i32, i32 addrspace(3)* %674, align 4, !tbaa !16
  %676 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 25
  %677 = load i32, i32 addrspace(3)* %676, align 4, !tbaa !16
  %678 = add nsw i32 %677, %675
  store i32 %678, i32 addrspace(3)* %676, align 4, !tbaa !16
  br label %679

679:                                              ; preds = %522, %520
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %680 = icmp ult i32 %4, 4
  br i1 %680, label %681, label %838

681:                                              ; preds = %679
  %682 = mul nuw nsw i32 %4, 27
  %683 = add nuw nsw i32 %682, 108
  %684 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %683
  %685 = load i32, i32 addrspace(3)* %684, align 4, !tbaa !16
  %686 = load i32, i32 addrspace(3)* %12, align 4, !tbaa !16
  %687 = add nsw i32 %686, %685
  store i32 %687, i32 addrspace(3)* %12, align 4, !tbaa !16
  %688 = add nuw nsw i32 %682, 109
  %689 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %688
  %690 = load i32, i32 addrspace(3)* %689, align 4, !tbaa !16
  %691 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 1
  %692 = load i32, i32 addrspace(3)* %691, align 4, !tbaa !16
  %693 = add nsw i32 %692, %690
  store i32 %693, i32 addrspace(3)* %691, align 4, !tbaa !16
  %694 = add nuw nsw i32 %682, 110
  %695 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %694
  %696 = load i32, i32 addrspace(3)* %695, align 4, !tbaa !16
  %697 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 2
  %698 = load i32, i32 addrspace(3)* %697, align 4, !tbaa !16
  %699 = add nsw i32 %698, %696
  store i32 %699, i32 addrspace(3)* %697, align 4, !tbaa !16
  %700 = add nuw nsw i32 %682, 111
  %701 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %700
  %702 = load i32, i32 addrspace(3)* %701, align 4, !tbaa !16
  %703 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 3
  %704 = load i32, i32 addrspace(3)* %703, align 4, !tbaa !16
  %705 = add nsw i32 %704, %702
  store i32 %705, i32 addrspace(3)* %703, align 4, !tbaa !16
  %706 = add nuw nsw i32 %682, 112
  %707 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %706
  %708 = load i32, i32 addrspace(3)* %707, align 4, !tbaa !16
  %709 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 4
  %710 = load i32, i32 addrspace(3)* %709, align 4, !tbaa !16
  %711 = add nsw i32 %710, %708
  store i32 %711, i32 addrspace(3)* %709, align 4, !tbaa !16
  %712 = add nuw nsw i32 %682, 113
  %713 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %712
  %714 = load i32, i32 addrspace(3)* %713, align 4, !tbaa !16
  %715 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 5
  %716 = load i32, i32 addrspace(3)* %715, align 4, !tbaa !16
  %717 = add nsw i32 %716, %714
  store i32 %717, i32 addrspace(3)* %715, align 4, !tbaa !16
  %718 = add nuw nsw i32 %682, 114
  %719 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %718
  %720 = load i32, i32 addrspace(3)* %719, align 4, !tbaa !16
  %721 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 6
  %722 = load i32, i32 addrspace(3)* %721, align 4, !tbaa !16
  %723 = add nsw i32 %722, %720
  store i32 %723, i32 addrspace(3)* %721, align 4, !tbaa !16
  %724 = add nuw nsw i32 %682, 115
  %725 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %724
  %726 = load i32, i32 addrspace(3)* %725, align 4, !tbaa !16
  %727 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 7
  %728 = load i32, i32 addrspace(3)* %727, align 4, !tbaa !16
  %729 = add nsw i32 %728, %726
  store i32 %729, i32 addrspace(3)* %727, align 4, !tbaa !16
  %730 = add nuw nsw i32 %682, 116
  %731 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %730
  %732 = load i32, i32 addrspace(3)* %731, align 4, !tbaa !16
  %733 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 8
  %734 = load i32, i32 addrspace(3)* %733, align 4, !tbaa !16
  %735 = add nsw i32 %734, %732
  store i32 %735, i32 addrspace(3)* %733, align 4, !tbaa !16
  %736 = add nuw nsw i32 %682, 117
  %737 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %736
  %738 = load i32, i32 addrspace(3)* %737, align 4, !tbaa !16
  %739 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 9
  %740 = load i32, i32 addrspace(3)* %739, align 4, !tbaa !16
  %741 = add nsw i32 %740, %738
  store i32 %741, i32 addrspace(3)* %739, align 4, !tbaa !16
  %742 = add nuw nsw i32 %682, 118
  %743 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %742
  %744 = load i32, i32 addrspace(3)* %743, align 4, !tbaa !16
  %745 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 10
  %746 = load i32, i32 addrspace(3)* %745, align 4, !tbaa !16
  %747 = add nsw i32 %746, %744
  store i32 %747, i32 addrspace(3)* %745, align 4, !tbaa !16
  %748 = add nuw nsw i32 %682, 119
  %749 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %748
  %750 = load i32, i32 addrspace(3)* %749, align 4, !tbaa !16
  %751 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 11
  %752 = load i32, i32 addrspace(3)* %751, align 4, !tbaa !16
  %753 = add nsw i32 %752, %750
  store i32 %753, i32 addrspace(3)* %751, align 4, !tbaa !16
  %754 = add nuw nsw i32 %682, 120
  %755 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %754
  %756 = load i32, i32 addrspace(3)* %755, align 4, !tbaa !16
  %757 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 12
  %758 = load i32, i32 addrspace(3)* %757, align 4, !tbaa !16
  %759 = add nsw i32 %758, %756
  store i32 %759, i32 addrspace(3)* %757, align 4, !tbaa !16
  %760 = add nuw nsw i32 %682, 121
  %761 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %760
  %762 = load i32, i32 addrspace(3)* %761, align 4, !tbaa !16
  %763 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 13
  %764 = load i32, i32 addrspace(3)* %763, align 4, !tbaa !16
  %765 = add nsw i32 %764, %762
  store i32 %765, i32 addrspace(3)* %763, align 4, !tbaa !16
  %766 = add nuw nsw i32 %682, 122
  %767 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %766
  %768 = load i32, i32 addrspace(3)* %767, align 4, !tbaa !16
  %769 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 14
  %770 = load i32, i32 addrspace(3)* %769, align 4, !tbaa !16
  %771 = add nsw i32 %770, %768
  store i32 %771, i32 addrspace(3)* %769, align 4, !tbaa !16
  %772 = add nuw nsw i32 %682, 123
  %773 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %772
  %774 = load i32, i32 addrspace(3)* %773, align 4, !tbaa !16
  %775 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 15
  %776 = load i32, i32 addrspace(3)* %775, align 4, !tbaa !16
  %777 = add nsw i32 %776, %774
  store i32 %777, i32 addrspace(3)* %775, align 4, !tbaa !16
  %778 = add nuw nsw i32 %682, 124
  %779 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %778
  %780 = load i32, i32 addrspace(3)* %779, align 4, !tbaa !16
  %781 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 16
  %782 = load i32, i32 addrspace(3)* %781, align 4, !tbaa !16
  %783 = add nsw i32 %782, %780
  store i32 %783, i32 addrspace(3)* %781, align 4, !tbaa !16
  %784 = add nuw nsw i32 %682, 125
  %785 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %784
  %786 = load i32, i32 addrspace(3)* %785, align 4, !tbaa !16
  %787 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 17
  %788 = load i32, i32 addrspace(3)* %787, align 4, !tbaa !16
  %789 = add nsw i32 %788, %786
  store i32 %789, i32 addrspace(3)* %787, align 4, !tbaa !16
  %790 = add nuw nsw i32 %682, 126
  %791 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %790
  %792 = load i32, i32 addrspace(3)* %791, align 4, !tbaa !16
  %793 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 18
  %794 = load i32, i32 addrspace(3)* %793, align 4, !tbaa !16
  %795 = add nsw i32 %794, %792
  store i32 %795, i32 addrspace(3)* %793, align 4, !tbaa !16
  %796 = add nuw nsw i32 %682, 127
  %797 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %796
  %798 = load i32, i32 addrspace(3)* %797, align 4, !tbaa !16
  %799 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 19
  %800 = load i32, i32 addrspace(3)* %799, align 4, !tbaa !16
  %801 = add nsw i32 %800, %798
  store i32 %801, i32 addrspace(3)* %799, align 4, !tbaa !16
  %802 = add nuw nsw i32 %682, 128
  %803 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %802
  %804 = load i32, i32 addrspace(3)* %803, align 4, !tbaa !16
  %805 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 20
  %806 = load i32, i32 addrspace(3)* %805, align 4, !tbaa !16
  %807 = add nsw i32 %806, %804
  store i32 %807, i32 addrspace(3)* %805, align 4, !tbaa !16
  %808 = add nuw nsw i32 %682, 129
  %809 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %808
  %810 = load i32, i32 addrspace(3)* %809, align 4, !tbaa !16
  %811 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 21
  %812 = load i32, i32 addrspace(3)* %811, align 4, !tbaa !16
  %813 = add nsw i32 %812, %810
  store i32 %813, i32 addrspace(3)* %811, align 4, !tbaa !16
  %814 = add nuw nsw i32 %682, 130
  %815 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %814
  %816 = load i32, i32 addrspace(3)* %815, align 4, !tbaa !16
  %817 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 22
  %818 = load i32, i32 addrspace(3)* %817, align 4, !tbaa !16
  %819 = add nsw i32 %818, %816
  store i32 %819, i32 addrspace(3)* %817, align 4, !tbaa !16
  %820 = add nuw nsw i32 %682, 131
  %821 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %820
  %822 = load i32, i32 addrspace(3)* %821, align 4, !tbaa !16
  %823 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 23
  %824 = load i32, i32 addrspace(3)* %823, align 4, !tbaa !16
  %825 = add nsw i32 %824, %822
  store i32 %825, i32 addrspace(3)* %823, align 4, !tbaa !16
  %826 = add nuw nsw i32 %682, 132
  %827 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %826
  %828 = load i32, i32 addrspace(3)* %827, align 4, !tbaa !16
  %829 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 24
  %830 = load i32, i32 addrspace(3)* %829, align 4, !tbaa !16
  %831 = add nsw i32 %830, %828
  store i32 %831, i32 addrspace(3)* %829, align 4, !tbaa !16
  %832 = add nuw nsw i32 %682, 133
  %833 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %832
  %834 = load i32, i32 addrspace(3)* %833, align 4, !tbaa !16
  %835 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 25
  %836 = load i32, i32 addrspace(3)* %835, align 4, !tbaa !16
  %837 = add nsw i32 %836, %834
  store i32 %837, i32 addrspace(3)* %835, align 4, !tbaa !16
  br label %838

838:                                              ; preds = %681, %679
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %839 = icmp ult i32 %4, 2
  br i1 %839, label %840, label %997

840:                                              ; preds = %838
  %841 = mul nuw nsw i32 %4, 27
  %842 = add nuw nsw i32 %841, 54
  %843 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %842
  %844 = load i32, i32 addrspace(3)* %843, align 4, !tbaa !16
  %845 = load i32, i32 addrspace(3)* %12, align 4, !tbaa !16
  %846 = add nsw i32 %845, %844
  store i32 %846, i32 addrspace(3)* %12, align 4, !tbaa !16
  %847 = add nuw nsw i32 %841, 55
  %848 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %847
  %849 = load i32, i32 addrspace(3)* %848, align 4, !tbaa !16
  %850 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 1
  %851 = load i32, i32 addrspace(3)* %850, align 4, !tbaa !16
  %852 = add nsw i32 %851, %849
  store i32 %852, i32 addrspace(3)* %850, align 4, !tbaa !16
  %853 = add nuw nsw i32 %841, 56
  %854 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %853
  %855 = load i32, i32 addrspace(3)* %854, align 4, !tbaa !16
  %856 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 2
  %857 = load i32, i32 addrspace(3)* %856, align 4, !tbaa !16
  %858 = add nsw i32 %857, %855
  store i32 %858, i32 addrspace(3)* %856, align 4, !tbaa !16
  %859 = add nuw nsw i32 %841, 57
  %860 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %859
  %861 = load i32, i32 addrspace(3)* %860, align 4, !tbaa !16
  %862 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 3
  %863 = load i32, i32 addrspace(3)* %862, align 4, !tbaa !16
  %864 = add nsw i32 %863, %861
  store i32 %864, i32 addrspace(3)* %862, align 4, !tbaa !16
  %865 = add nuw nsw i32 %841, 58
  %866 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %865
  %867 = load i32, i32 addrspace(3)* %866, align 4, !tbaa !16
  %868 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 4
  %869 = load i32, i32 addrspace(3)* %868, align 4, !tbaa !16
  %870 = add nsw i32 %869, %867
  store i32 %870, i32 addrspace(3)* %868, align 4, !tbaa !16
  %871 = add nuw nsw i32 %841, 59
  %872 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %871
  %873 = load i32, i32 addrspace(3)* %872, align 4, !tbaa !16
  %874 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 5
  %875 = load i32, i32 addrspace(3)* %874, align 4, !tbaa !16
  %876 = add nsw i32 %875, %873
  store i32 %876, i32 addrspace(3)* %874, align 4, !tbaa !16
  %877 = add nuw nsw i32 %841, 60
  %878 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %877
  %879 = load i32, i32 addrspace(3)* %878, align 4, !tbaa !16
  %880 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 6
  %881 = load i32, i32 addrspace(3)* %880, align 4, !tbaa !16
  %882 = add nsw i32 %881, %879
  store i32 %882, i32 addrspace(3)* %880, align 4, !tbaa !16
  %883 = add nuw nsw i32 %841, 61
  %884 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %883
  %885 = load i32, i32 addrspace(3)* %884, align 4, !tbaa !16
  %886 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 7
  %887 = load i32, i32 addrspace(3)* %886, align 4, !tbaa !16
  %888 = add nsw i32 %887, %885
  store i32 %888, i32 addrspace(3)* %886, align 4, !tbaa !16
  %889 = add nuw nsw i32 %841, 62
  %890 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %889
  %891 = load i32, i32 addrspace(3)* %890, align 4, !tbaa !16
  %892 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 8
  %893 = load i32, i32 addrspace(3)* %892, align 4, !tbaa !16
  %894 = add nsw i32 %893, %891
  store i32 %894, i32 addrspace(3)* %892, align 4, !tbaa !16
  %895 = add nuw nsw i32 %841, 63
  %896 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %895
  %897 = load i32, i32 addrspace(3)* %896, align 4, !tbaa !16
  %898 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 9
  %899 = load i32, i32 addrspace(3)* %898, align 4, !tbaa !16
  %900 = add nsw i32 %899, %897
  store i32 %900, i32 addrspace(3)* %898, align 4, !tbaa !16
  %901 = add nuw nsw i32 %841, 64
  %902 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %901
  %903 = load i32, i32 addrspace(3)* %902, align 4, !tbaa !16
  %904 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 10
  %905 = load i32, i32 addrspace(3)* %904, align 4, !tbaa !16
  %906 = add nsw i32 %905, %903
  store i32 %906, i32 addrspace(3)* %904, align 4, !tbaa !16
  %907 = add nuw nsw i32 %841, 65
  %908 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %907
  %909 = load i32, i32 addrspace(3)* %908, align 4, !tbaa !16
  %910 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 11
  %911 = load i32, i32 addrspace(3)* %910, align 4, !tbaa !16
  %912 = add nsw i32 %911, %909
  store i32 %912, i32 addrspace(3)* %910, align 4, !tbaa !16
  %913 = add nuw nsw i32 %841, 66
  %914 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %913
  %915 = load i32, i32 addrspace(3)* %914, align 4, !tbaa !16
  %916 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 12
  %917 = load i32, i32 addrspace(3)* %916, align 4, !tbaa !16
  %918 = add nsw i32 %917, %915
  store i32 %918, i32 addrspace(3)* %916, align 4, !tbaa !16
  %919 = add nuw nsw i32 %841, 67
  %920 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %919
  %921 = load i32, i32 addrspace(3)* %920, align 4, !tbaa !16
  %922 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 13
  %923 = load i32, i32 addrspace(3)* %922, align 4, !tbaa !16
  %924 = add nsw i32 %923, %921
  store i32 %924, i32 addrspace(3)* %922, align 4, !tbaa !16
  %925 = add nuw nsw i32 %841, 68
  %926 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %925
  %927 = load i32, i32 addrspace(3)* %926, align 4, !tbaa !16
  %928 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 14
  %929 = load i32, i32 addrspace(3)* %928, align 4, !tbaa !16
  %930 = add nsw i32 %929, %927
  store i32 %930, i32 addrspace(3)* %928, align 4, !tbaa !16
  %931 = add nuw nsw i32 %841, 69
  %932 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %931
  %933 = load i32, i32 addrspace(3)* %932, align 4, !tbaa !16
  %934 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 15
  %935 = load i32, i32 addrspace(3)* %934, align 4, !tbaa !16
  %936 = add nsw i32 %935, %933
  store i32 %936, i32 addrspace(3)* %934, align 4, !tbaa !16
  %937 = add nuw nsw i32 %841, 70
  %938 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %937
  %939 = load i32, i32 addrspace(3)* %938, align 4, !tbaa !16
  %940 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 16
  %941 = load i32, i32 addrspace(3)* %940, align 4, !tbaa !16
  %942 = add nsw i32 %941, %939
  store i32 %942, i32 addrspace(3)* %940, align 4, !tbaa !16
  %943 = add nuw nsw i32 %841, 71
  %944 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %943
  %945 = load i32, i32 addrspace(3)* %944, align 4, !tbaa !16
  %946 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 17
  %947 = load i32, i32 addrspace(3)* %946, align 4, !tbaa !16
  %948 = add nsw i32 %947, %945
  store i32 %948, i32 addrspace(3)* %946, align 4, !tbaa !16
  %949 = add nuw nsw i32 %841, 72
  %950 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %949
  %951 = load i32, i32 addrspace(3)* %950, align 4, !tbaa !16
  %952 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 18
  %953 = load i32, i32 addrspace(3)* %952, align 4, !tbaa !16
  %954 = add nsw i32 %953, %951
  store i32 %954, i32 addrspace(3)* %952, align 4, !tbaa !16
  %955 = add nuw nsw i32 %841, 73
  %956 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %955
  %957 = load i32, i32 addrspace(3)* %956, align 4, !tbaa !16
  %958 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 19
  %959 = load i32, i32 addrspace(3)* %958, align 4, !tbaa !16
  %960 = add nsw i32 %959, %957
  store i32 %960, i32 addrspace(3)* %958, align 4, !tbaa !16
  %961 = add nuw nsw i32 %841, 74
  %962 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %961
  %963 = load i32, i32 addrspace(3)* %962, align 4, !tbaa !16
  %964 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 20
  %965 = load i32, i32 addrspace(3)* %964, align 4, !tbaa !16
  %966 = add nsw i32 %965, %963
  store i32 %966, i32 addrspace(3)* %964, align 4, !tbaa !16
  %967 = add nuw nsw i32 %841, 75
  %968 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %967
  %969 = load i32, i32 addrspace(3)* %968, align 4, !tbaa !16
  %970 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 21
  %971 = load i32, i32 addrspace(3)* %970, align 4, !tbaa !16
  %972 = add nsw i32 %971, %969
  store i32 %972, i32 addrspace(3)* %970, align 4, !tbaa !16
  %973 = add nuw nsw i32 %841, 76
  %974 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %973
  %975 = load i32, i32 addrspace(3)* %974, align 4, !tbaa !16
  %976 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 22
  %977 = load i32, i32 addrspace(3)* %976, align 4, !tbaa !16
  %978 = add nsw i32 %977, %975
  store i32 %978, i32 addrspace(3)* %976, align 4, !tbaa !16
  %979 = add nuw nsw i32 %841, 77
  %980 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %979
  %981 = load i32, i32 addrspace(3)* %980, align 4, !tbaa !16
  %982 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 23
  %983 = load i32, i32 addrspace(3)* %982, align 4, !tbaa !16
  %984 = add nsw i32 %983, %981
  store i32 %984, i32 addrspace(3)* %982, align 4, !tbaa !16
  %985 = add nuw nsw i32 %841, 78
  %986 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %985
  %987 = load i32, i32 addrspace(3)* %986, align 4, !tbaa !16
  %988 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 24
  %989 = load i32, i32 addrspace(3)* %988, align 4, !tbaa !16
  %990 = add nsw i32 %989, %987
  store i32 %990, i32 addrspace(3)* %988, align 4, !tbaa !16
  %991 = add nuw nsw i32 %841, 79
  %992 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %991
  %993 = load i32, i32 addrspace(3)* %992, align 4, !tbaa !16
  %994 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 25
  %995 = load i32, i32 addrspace(3)* %994, align 4, !tbaa !16
  %996 = add nsw i32 %995, %993
  store i32 %996, i32 addrspace(3)* %994, align 4, !tbaa !16
  br label %997

997:                                              ; preds = %840, %838
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %998 = icmp eq i32 %4, 0
  br i1 %998, label %999, label %1156

999:                                              ; preds = %997
  %1000 = mul nuw nsw i32 %4, 27
  %1001 = add nuw nsw i32 %1000, 27
  %1002 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1001
  %1003 = load i32, i32 addrspace(3)* %1002, align 4, !tbaa !16
  %1004 = load i32, i32 addrspace(3)* %12, align 4, !tbaa !16
  %1005 = add nsw i32 %1004, %1003
  store i32 %1005, i32 addrspace(3)* %12, align 4, !tbaa !16
  %1006 = add nuw nsw i32 %1000, 28
  %1007 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1006
  %1008 = load i32, i32 addrspace(3)* %1007, align 4, !tbaa !16
  %1009 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 1
  %1010 = load i32, i32 addrspace(3)* %1009, align 4, !tbaa !16
  %1011 = add nsw i32 %1010, %1008
  store i32 %1011, i32 addrspace(3)* %1009, align 4, !tbaa !16
  %1012 = add nuw nsw i32 %1000, 29
  %1013 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1012
  %1014 = load i32, i32 addrspace(3)* %1013, align 4, !tbaa !16
  %1015 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 2
  %1016 = load i32, i32 addrspace(3)* %1015, align 4, !tbaa !16
  %1017 = add nsw i32 %1016, %1014
  store i32 %1017, i32 addrspace(3)* %1015, align 4, !tbaa !16
  %1018 = add nuw nsw i32 %1000, 30
  %1019 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1018
  %1020 = load i32, i32 addrspace(3)* %1019, align 4, !tbaa !16
  %1021 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 3
  %1022 = load i32, i32 addrspace(3)* %1021, align 4, !tbaa !16
  %1023 = add nsw i32 %1022, %1020
  store i32 %1023, i32 addrspace(3)* %1021, align 4, !tbaa !16
  %1024 = add nuw nsw i32 %1000, 31
  %1025 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1024
  %1026 = load i32, i32 addrspace(3)* %1025, align 4, !tbaa !16
  %1027 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 4
  %1028 = load i32, i32 addrspace(3)* %1027, align 4, !tbaa !16
  %1029 = add nsw i32 %1028, %1026
  store i32 %1029, i32 addrspace(3)* %1027, align 4, !tbaa !16
  %1030 = add nuw nsw i32 %1000, 32
  %1031 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1030
  %1032 = load i32, i32 addrspace(3)* %1031, align 4, !tbaa !16
  %1033 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 5
  %1034 = load i32, i32 addrspace(3)* %1033, align 4, !tbaa !16
  %1035 = add nsw i32 %1034, %1032
  store i32 %1035, i32 addrspace(3)* %1033, align 4, !tbaa !16
  %1036 = add nuw nsw i32 %1000, 33
  %1037 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1036
  %1038 = load i32, i32 addrspace(3)* %1037, align 4, !tbaa !16
  %1039 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 6
  %1040 = load i32, i32 addrspace(3)* %1039, align 4, !tbaa !16
  %1041 = add nsw i32 %1040, %1038
  store i32 %1041, i32 addrspace(3)* %1039, align 4, !tbaa !16
  %1042 = add nuw nsw i32 %1000, 34
  %1043 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1042
  %1044 = load i32, i32 addrspace(3)* %1043, align 4, !tbaa !16
  %1045 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 7
  %1046 = load i32, i32 addrspace(3)* %1045, align 4, !tbaa !16
  %1047 = add nsw i32 %1046, %1044
  store i32 %1047, i32 addrspace(3)* %1045, align 4, !tbaa !16
  %1048 = add nuw nsw i32 %1000, 35
  %1049 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1048
  %1050 = load i32, i32 addrspace(3)* %1049, align 4, !tbaa !16
  %1051 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 8
  %1052 = load i32, i32 addrspace(3)* %1051, align 4, !tbaa !16
  %1053 = add nsw i32 %1052, %1050
  store i32 %1053, i32 addrspace(3)* %1051, align 4, !tbaa !16
  %1054 = add nuw nsw i32 %1000, 36
  %1055 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1054
  %1056 = load i32, i32 addrspace(3)* %1055, align 4, !tbaa !16
  %1057 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 9
  %1058 = load i32, i32 addrspace(3)* %1057, align 4, !tbaa !16
  %1059 = add nsw i32 %1058, %1056
  store i32 %1059, i32 addrspace(3)* %1057, align 4, !tbaa !16
  %1060 = add nuw nsw i32 %1000, 37
  %1061 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1060
  %1062 = load i32, i32 addrspace(3)* %1061, align 4, !tbaa !16
  %1063 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 10
  %1064 = load i32, i32 addrspace(3)* %1063, align 4, !tbaa !16
  %1065 = add nsw i32 %1064, %1062
  store i32 %1065, i32 addrspace(3)* %1063, align 4, !tbaa !16
  %1066 = add nuw nsw i32 %1000, 38
  %1067 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1066
  %1068 = load i32, i32 addrspace(3)* %1067, align 4, !tbaa !16
  %1069 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 11
  %1070 = load i32, i32 addrspace(3)* %1069, align 4, !tbaa !16
  %1071 = add nsw i32 %1070, %1068
  store i32 %1071, i32 addrspace(3)* %1069, align 4, !tbaa !16
  %1072 = add nuw nsw i32 %1000, 39
  %1073 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1072
  %1074 = load i32, i32 addrspace(3)* %1073, align 4, !tbaa !16
  %1075 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 12
  %1076 = load i32, i32 addrspace(3)* %1075, align 4, !tbaa !16
  %1077 = add nsw i32 %1076, %1074
  store i32 %1077, i32 addrspace(3)* %1075, align 4, !tbaa !16
  %1078 = add nuw nsw i32 %1000, 40
  %1079 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1078
  %1080 = load i32, i32 addrspace(3)* %1079, align 4, !tbaa !16
  %1081 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 13
  %1082 = load i32, i32 addrspace(3)* %1081, align 4, !tbaa !16
  %1083 = add nsw i32 %1082, %1080
  store i32 %1083, i32 addrspace(3)* %1081, align 4, !tbaa !16
  %1084 = add nuw nsw i32 %1000, 41
  %1085 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1084
  %1086 = load i32, i32 addrspace(3)* %1085, align 4, !tbaa !16
  %1087 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 14
  %1088 = load i32, i32 addrspace(3)* %1087, align 4, !tbaa !16
  %1089 = add nsw i32 %1088, %1086
  store i32 %1089, i32 addrspace(3)* %1087, align 4, !tbaa !16
  %1090 = add nuw nsw i32 %1000, 42
  %1091 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1090
  %1092 = load i32, i32 addrspace(3)* %1091, align 4, !tbaa !16
  %1093 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 15
  %1094 = load i32, i32 addrspace(3)* %1093, align 4, !tbaa !16
  %1095 = add nsw i32 %1094, %1092
  store i32 %1095, i32 addrspace(3)* %1093, align 4, !tbaa !16
  %1096 = add nuw nsw i32 %1000, 43
  %1097 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1096
  %1098 = load i32, i32 addrspace(3)* %1097, align 4, !tbaa !16
  %1099 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 16
  %1100 = load i32, i32 addrspace(3)* %1099, align 4, !tbaa !16
  %1101 = add nsw i32 %1100, %1098
  store i32 %1101, i32 addrspace(3)* %1099, align 4, !tbaa !16
  %1102 = add nuw nsw i32 %1000, 44
  %1103 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1102
  %1104 = load i32, i32 addrspace(3)* %1103, align 4, !tbaa !16
  %1105 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 17
  %1106 = load i32, i32 addrspace(3)* %1105, align 4, !tbaa !16
  %1107 = add nsw i32 %1106, %1104
  store i32 %1107, i32 addrspace(3)* %1105, align 4, !tbaa !16
  %1108 = add nuw nsw i32 %1000, 45
  %1109 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1108
  %1110 = load i32, i32 addrspace(3)* %1109, align 4, !tbaa !16
  %1111 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 18
  %1112 = load i32, i32 addrspace(3)* %1111, align 4, !tbaa !16
  %1113 = add nsw i32 %1112, %1110
  store i32 %1113, i32 addrspace(3)* %1111, align 4, !tbaa !16
  %1114 = add nuw nsw i32 %1000, 46
  %1115 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1114
  %1116 = load i32, i32 addrspace(3)* %1115, align 4, !tbaa !16
  %1117 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 19
  %1118 = load i32, i32 addrspace(3)* %1117, align 4, !tbaa !16
  %1119 = add nsw i32 %1118, %1116
  store i32 %1119, i32 addrspace(3)* %1117, align 4, !tbaa !16
  %1120 = add nuw nsw i32 %1000, 47
  %1121 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1120
  %1122 = load i32, i32 addrspace(3)* %1121, align 4, !tbaa !16
  %1123 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 20
  %1124 = load i32, i32 addrspace(3)* %1123, align 4, !tbaa !16
  %1125 = add nsw i32 %1124, %1122
  store i32 %1125, i32 addrspace(3)* %1123, align 4, !tbaa !16
  %1126 = add nuw nsw i32 %1000, 48
  %1127 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1126
  %1128 = load i32, i32 addrspace(3)* %1127, align 4, !tbaa !16
  %1129 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 21
  %1130 = load i32, i32 addrspace(3)* %1129, align 4, !tbaa !16
  %1131 = add nsw i32 %1130, %1128
  store i32 %1131, i32 addrspace(3)* %1129, align 4, !tbaa !16
  %1132 = add nuw nsw i32 %1000, 49
  %1133 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1132
  %1134 = load i32, i32 addrspace(3)* %1133, align 4, !tbaa !16
  %1135 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 22
  %1136 = load i32, i32 addrspace(3)* %1135, align 4, !tbaa !16
  %1137 = add nsw i32 %1136, %1134
  store i32 %1137, i32 addrspace(3)* %1135, align 4, !tbaa !16
  %1138 = add nuw nsw i32 %1000, 50
  %1139 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1138
  %1140 = load i32, i32 addrspace(3)* %1139, align 4, !tbaa !16
  %1141 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 23
  %1142 = load i32, i32 addrspace(3)* %1141, align 4, !tbaa !16
  %1143 = add nsw i32 %1142, %1140
  store i32 %1143, i32 addrspace(3)* %1141, align 4, !tbaa !16
  %1144 = add nuw nsw i32 %1000, 51
  %1145 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1144
  %1146 = load i32, i32 addrspace(3)* %1145, align 4, !tbaa !16
  %1147 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 24
  %1148 = load i32, i32 addrspace(3)* %1147, align 4, !tbaa !16
  %1149 = add nsw i32 %1148, %1146
  store i32 %1149, i32 addrspace(3)* %1147, align 4, !tbaa !16
  %1150 = add nuw nsw i32 %1000, 52
  %1151 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %1150
  %1152 = load i32, i32 addrspace(3)* %1151, align 4, !tbaa !16
  %1153 = getelementptr inbounds i32, i32 addrspace(3)* %12, i32 25
  %1154 = load i32, i32 addrspace(3)* %1153, align 4, !tbaa !16
  %1155 = add nsw i32 %1154, %1152
  store i32 %1155, i32 addrspace(3)* %1153, align 4, !tbaa !16
  br label %1156

1156:                                             ; preds = %999, %997
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %1157 = icmp ult i32 %4, 26
  br i1 %1157, label %1158, label %1164

1158:                                             ; preds = %1156
  %1159 = zext i32 %4 to i64
  %1160 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %1159
  %1161 = getelementptr inbounds [3456 x i32], [3456 x i32] addrspace(3)* @_ZZ13freqencyStep1PciPiE5sfreq, i32 0, i32 %4
  %1162 = load i32, i32 addrspace(3)* %1161, align 4, !tbaa !16
  %1163 = atomicrmw add i32 addrspace(1)* %1160, i32 %1162 syncscope("agent-one-as") monotonic, align 4
  br label %1164

1164:                                             ; preds = %1158, %1156
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!18, !18, i64 0}
!23 = distinct !{!23, !21}
